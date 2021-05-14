namespace Slack\GraphQL\Types;

use namespace Slack\GraphQL;

final class IntOutputType extends ScalarOutputType {
    const type THackType = int;
    const GraphQL\Introspection\__TypeKind TYPE_KIND = GraphQL\Introspection\__TypeKind::SCALAR;
    const string NAME = 'Int';

    const int MIN_SAFE_VALUE = -2147483648;
    const int MAX_SAFE_VALUE = 2147483647;

    <<__Override>>
    protected function coerce(int $value): int {
        \Slack\GraphQL\assert(
            $value >= self::MIN_SAFE_VALUE && $value <= self::MAX_SAFE_VALUE,
            'Integers must be in 32-bit range, got %d',
            $value,
        );
        return $value;
    }
}
