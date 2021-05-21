namespace Slack\GraphQL\Types;
use namespace Slack\GraphQL;

final class NullableOutputType<TInner as nonnull, TResolved> extends BaseType {
    use TNullableType;
    use TOutputType<?TInner, ?TResolved>;

    public function __construct(private INonNullableOutputTypeFor<TInner, TResolved> $inner_type) {
        parent::__construct($inner_type->schema);
    }

    public function getInnerType(): INonNullableOutputTypeFor<TInner, TResolved> {
        return $this->inner_type;
    }

    <<__Override>>
    final public function unwrapType(): INamedOutputType {
        return $this->inner_type->unwrapType();
    }

    /**
     * Nullable fields act as an "error boundary". Any InvalidFieldResults are converted to a ValidFieldResult (with
     * null value) here. Note the stronger return type compared to the parent class.
     */
    <<__Override>>
    public async function resolveAsync(
        ?TInner $value,
        \Graphpinator\Parser\Field\IHasFieldSet $field,
        GraphQL\Variables $vars,
    ): Awaitable<GraphQL\ValidFieldResult<?TResolved>> {
        if ($value is null) {
            return new GraphQL\ValidFieldResult(null);
        }
        $result = await $this->inner_type->resolveAsync($value, $field, $vars);
        return $result is GraphQL\ValidFieldResult<_>
            ? $result
            : new GraphQL\ValidFieldResult(null, $result->getErrors());
    }

    public function resolveError(GraphQL\UserFacingError $error): GraphQL\ValidFieldResult<null> {
        return new GraphQL\ValidFieldResult(null, vec[$error]);
    }
}
