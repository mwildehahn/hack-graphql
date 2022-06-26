


namespace Slack\GraphQL\Codegen;

use namespace HH\Lib\{C, Str, Vec};
use type Facebook\HackCodegen\{
    CodegenClass,
    HackCodegenFactory,
    CodegenClassConstant,
    HackBuilderValues,
    HackBuilderKeys,
};

class ObjectBuilder extends CompositeBuilder {
    const classname<\Slack\GraphQL\Types\ObjectType> SUPERCLASS = \Slack\GraphQL\Types\ObjectType::class;

    <<__Override>>
    public function __construct(
        Context $ctx,
        \Slack\GraphQL\__Private\CompositeType $type_info,
        string $hack_type,
        vec<FieldBuilder> $fields,
        private dict<string, string> $hack_class_to_graphql_interface,
    ) {
        parent::__construct($ctx, $type_info, $hack_type, $fields);
    }

    <<__Override>>
    public function build(HackCodegenFactory $cg): CodegenClass {
        return parent::build($cg)
            ->addConstant($this->generateInterfacesConstant($cg));
    }

    private function generateInterfacesConstant(HackCodegenFactory $cg): CodegenClassConstant {
        $interfaces = dict[];
        foreach ($this->hack_class_to_graphql_interface as $hack_class => $graphql_type) {
            if (\is_subclass_of($this->hack_type, $hack_class)) {
                $interfaces[$graphql_type] = Str\format('%s::class', $graphql_type);
            }
        }

        return $cg->codegenClassConstant('INTERFACES')
            ->setType('dict<string, classname<Types\InterfaceType>>')
            ->setValue($interfaces, HackBuilderValues::dict(HackBuilderKeys::export(), HackBuilderValues::literal()));
    }

    public static function fromTypeAlias<T>(
        Context $ctx,
        \Slack\GraphQL\ObjectType $type_info,
        \ReflectionTypeAlias $type_alias,
    ): ObjectBuilder {
        $ts = $type_alias->getResolvedTypeStructure();
        invariant(
            $ts['kind'] === \HH\TypeStructureKind::OF_SHAPE && !idx($ts, 'nullable', false),
            'Output objects can only be generated from type aliases of a non-nullable shape type, got %s.',
            TypeStructureKind::getNames()[$ts['kind']],
        );
        return new ObjectBuilder(
            $ctx,
            $type_info,
            $type_alias->getName(),
            Vec\map_with_key($ts['fields'], ($name, $ts) ==> FieldBuilder::fromShapeField($ctx, $name, $ts)),
            dict[], // Objects generated from shapes cannot implement interfaces
        );
    }

    public static function forConnection(
        Context $ctx,
        string $name,
        \Slack\GraphQL\ObjectType $object_type,
        string $edge_name,
        vec<FieldBuilder> $additional_fields,
    ): ObjectBuilder {
        return new ObjectBuilder(
            $ctx,
            $object_type,
            $name, // hack type
            Vec\concat(
                vec[ // fields
                    new MethodFieldBuilder(
                        $ctx,
                        shape(
                            'name' => 'edges',
                            'method_name' => 'getEdges',
                            'output_type' => shape(
                                'type' => $edge_name.'::nonNullable()->nullableOutputListOf()',
                                'needs_await' => true,
                            ),
                            'parameters' => vec[],
                        ),
                    ),
                    new MethodFieldBuilder(
                        $ctx,
                        shape(
                            'name' => 'pageInfo',
                            'method_name' => 'getPageInfo',
                            'output_type' => shape('type' => 'PageInfo::nullableOutput()', 'needs_await' => true),
                            'parameters' => vec[],
                        ),
                    ),
                ],
                $additional_fields,
            ),
            dict[], // Connections do not implement any interfaces
        );
    }

    // TODO: It should be possible to create user-defined edges which contain additional fields.
    public static function forEdge(
        Context $ctx,
        string $gql_type,
        string $hack_type,
        string $output_type,
    ): ObjectBuilder {
        $name = $gql_type.'Edge';
        return new ObjectBuilder(
            $ctx,
            new \Slack\GraphQL\ObjectType($name, $gql_type.' Edge'), // TODO: Description
            'Slack\GraphQL\Pagination\Edge<'.$hack_type.'>', // hack type
            vec[ // fields
                new MethodFieldBuilder(
                    $ctx,
                    shape(
                        'name' => 'node',
                        'method_name' => 'getNode',
                        'output_type' => shape('type' => $output_type.'::nullableOutput()'),
                        'parameters' => vec[],
                    ),
                ),
                new MethodFieldBuilder(
                    $ctx,
                    shape(
                        'name' => 'cursor',
                        'method_name' => 'getCursor',
                        'output_type' => shape('type' => 'Types\StringType::nullableOutput()'),
                        'parameters' => vec[],
                    ),
                ),
            ],
            dict[],
        );
    }
}
