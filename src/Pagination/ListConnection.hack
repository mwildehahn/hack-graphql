


namespace Slack\GraphQL\Pagination;

use namespace HH\Lib\{C, Math, Str};

/**
 * A connection which paginates over a vec of items.
 *
 * This is useful when you want to imitate real pagination, e.g., during prototyping.
 */
abstract class ListConnection extends Connection {
    public function __construct(private vec<this::TNode> $items) {}

    public async function fetch(PaginationArgs $args): Awaitable<vec<Edge<this::TNode>>> {
        $start_id = 0;
        $end_id = C\count($this->items);

        $after = $args['after'] ?? null;
        if ($after is nonnull) {
            $start_id = Str\to_int($after) as nonnull + 1; // Add one to skip the `after` cursor.
        }

        $before = $args['before'] ?? null;
        if ($before is nonnull) {
            $end_id = Str\to_int($before) as nonnull;
        }

        $first = $args['first'] ?? null;
        if ($first is nonnull) {
            $end_id = Math\minva($end_id, $start_id + $first);
        }

        $last = $args['last'] ?? null;
        if ($last is nonnull) {
            $start_id = Math\maxva($start_id, $end_id - $last);
        }

        $edges = vec[];
        for ($i = $start_id; $i < $end_id; $i++) {
            $edges[] = new Edge($this->items[$i], $this->encodeCursor((string)$i));
        }
        return $edges;
    }
}
