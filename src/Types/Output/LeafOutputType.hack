namespace Slack\GraphQL\Types;

use namespace Slack\GraphQL;

abstract class LeafOutputType extends NamedOutputType {
    abstract const type TCoerced as mixed = this::THackType;

    /**
     * Throw UserFacingError if the value can't be coerced (e.g. Int out of 32-bit range).
     */
    abstract protected function coerce(this::THackType $value): this::TCoerced;

    <<__Override>>
    final public async function resolveAsync(
        this::THackType $value,
        \Graphpinator\Parser\Field\IHasFieldSet $field,
        GraphQL\Variables $vars,
    ): Awaitable<GraphQL\FieldResult<this::TCoerced>> {
        try {
            return new GraphQL\ValidFieldResult($this->coerce($value));
        } catch (GraphQL\UserFacingError $e) {
            return new GraphQL\InvalidFieldResult(vec[$e]);
        }
    }

    <<__Override>>
    final public function getFields(): null {
        return null;
    }
}
