namespace Slack\GraphQL\Types;

use namespace Slack\GraphQL;

abstract class EnumOutputType extends LeafType {
    abstract const type THackType as arraykey;
    abstract const \HH\enumname<this::THackType> HACK_ENUM;
    const type TCoerced = string;

    /**
     * Enum values are surfaced to GraphQL clients as their name, not their internal value.
     */
    <<__Override>>
    final protected function coerce(this::THackType $value): string {
        $hack_enum = static::HACK_ENUM;
        return $hack_enum::getNames()[$value];
    }

    public function getTypeKind(): GraphQL\Introspection\__TypeKind {
        return GraphQL\Introspection\__TypeKind::ENUM;
    }

}
