namespace Slack\GraphQL\Types;

use namespace HH\Lib\{Dict, Vec};
use namespace Slack\GraphQL;

abstract class InterfaceType extends CompositeType {
    abstract const keyset<string> POSSIBLE_TYPES;

    <<__Override>>
    final public function getKind(): GraphQL\Introspection\__TypeKind {
        return GraphQL\Introspection\__TypeKind::INTERFACE;
    }

    <<__Override>>
    final public function getPossibleTypes(): vec<GraphQL\Introspection\__Type> {
        return Vec\map(static::POSSIBLE_TYPES, $type ==> $this->schema->getIntrospectionType($type) as nonnull);
    }
}
