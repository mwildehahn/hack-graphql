namespace Slack\GraphQL\Types;

use namespace HH\Lib\Vec;
use namespace Slack\GraphQL;

final class ListOutputType<TInner, TResolved> extends BaseType implements GraphQL\Introspection\__Type {
    use TOutputType<vec<TInner>, vec<mixed>>;

    public function __construct(private IOutputTypeFor<TInner, TResolved> $inner_type) {}

    <<__Override>>
    public function getName(): ?string {
        return null;
    }

    <<__Override>>
    final public function unwrapType(): INamedOutputType {
        return $this->inner_type->unwrapType();
    }

    <<__Override>>
    final public async function resolveAsync(
        vec<TInner> $value,
        \Graphpinator\Parser\Field\IHasFieldSet $field,
        GraphQL\Variables $vars,
    ): Awaitable<GraphQL\FieldResult<vec<mixed>>> {
        $ret = vec[];
        $errors = vec[];
        $is_valid = true;

        $results = await Vec\map_async(
            $value,
            async $item ==> await $this->inner_type->resolveAsync($item, $field, $vars),
        );

        foreach ($results as $idx => $result) {
            if ($result is GraphQL\ValidFieldResult<_>) {
                $ret[] = $result->getValue();
            } else {
                $is_valid = false;
            }
            foreach ($result->getErrors() as $error) {
                $errors[] = $error->prependPath($idx);
            }
        }

        return $is_valid ? new GraphQL\ValidFieldResult($ret, $errors) : new GraphQL\InvalidFieldResult($errors);
    }

    final public function getKind(): GraphQL\Introspection\__TypeKind {
        return GraphQL\Introspection\__TypeKind::LIST;
    }

    <<__Override>>
    final public function getOfType(): GraphQL\Introspection\__Type {
        if ($this->inner_type is NullableOutputType<_, _>) {
            return $this->inner_type->getInnerType();
        }

        return new GraphQL\Introspection\NonNullable($this->inner_type as GraphQL\Introspection\__Type);
    }
}
