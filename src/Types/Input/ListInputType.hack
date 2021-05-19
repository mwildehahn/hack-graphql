namespace Slack\GraphQL\Types;

use namespace HH\Lib\Vec;
use namespace Graphpinator\Parser\Value;
use namespace Slack\GraphQL;
use type Slack\GraphQL\UserFacingError;

final class ListInputType<TInner> extends InputType<vec<TInner>> {

    public function __construct(private InputType<TInner> $inner_type) {}

    public function getInnerType(): InputType<TInner> {
        return $this->inner_type;
    }

    <<__Override>>
    public function getName(): ?string {
        return null;
    }

    <<__Override>>
    final public function unwrapType(): NamedInputType {
        return $this->getInnerType()->unwrapType();
    }

    <<__Override>>
    public function coerceValue(mixed $value): vec<TInner> {
        if (!$value is Container<_>) {
            // See https://spec.graphql.org/draft/#sec-Type-System.List.Input-Coercion
            return vec[$this->inner_type->coerceValue($value)];
        }
        return Vec\map($value, $item ==> $this->inner_type->coerceValue($item));
    }

    <<__Override>>
    final public function coerceNonVariableNode(Value\Value $node, dict<string, mixed> $variable_values): vec<TInner> {
        if (!$node is Value\ListVal) {
            return vec[$this->inner_type->coerceNode($node, $variable_values)];
        }
        return Vec\map($node->getValue(), $item_node ==> $this->inner_type->coerceNode($item_node, $variable_values));
    }

    <<__Override>>
    public function assertValidVariableValue(mixed $value): vec<TInner> {
        return Vec\map($value as vec<_>, $item ==> $this->inner_type->coerceValue($item));
    }

    <<__Override>>
    final public function introspect(): GraphQL\Introspection\NonNullableType {
        return new GraphQL\Introspection\NonNullableType(
            new GraphQL\Introspection\ListType($this->inner_type->introspect()),
        );
    }
}
