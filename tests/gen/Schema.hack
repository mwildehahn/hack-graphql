/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<1580f1b40c1aff38c6937d089b8198b0>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class Schema extends \Slack\GraphQL\BaseSchema {

  const dict<string, classname<Types\NamedType>> TYPES = dict[
    'AlphabetConnection' => AlphabetConnection::class,
    'AnotherObjectShape' => AnotherObjectShape::class,
    'Boolean' => Types\BooleanType::class,
    'Bot' => Bot::class,
    'Concrete' => Concrete::class,
    'CreateTeamInput' => CreateTeamInput::class,
    'CreateUserInput' => CreateUserInput::class,
    'ErrorTestObj' => ErrorTestObj::class,
    'FavoriteColor' => FavoriteColor::class,
    'FooInterface' => FooInterface::class,
    'FooObject' => FooObject::class,
    'Human' => Human::class,
    'IIntrospectionInterfaceA' => IIntrospectionInterfaceA::class,
    'IIntrospectionInterfaceB' => IIntrospectionInterfaceB::class,
    'IIntrospectionInterfaceC' => IIntrospectionInterfaceC::class,
    'ImplementInterfaceA' => ImplementInterfaceA::class,
    'ImplementInterfaceB' => ImplementInterfaceB::class,
    'ImplementInterfaceC' => ImplementInterfaceC::class,
    'Int' => Types\IntType::class,
    'InterfaceA' => InterfaceA::class,
    'InterfaceB' => InterfaceB::class,
    'IntrospectionEnum' => IntrospectionEnum::class,
    'IntrospectionNestedInput' => IntrospectionNestedInput::class,
    'IntrospectionRootInput' => IntrospectionRootInput::class,
    'IntrospectionTestObject' => IntrospectionTestObject::class,
    'Mutation' => Mutation::class,
    'NestedOutputShape' => NestedOutputShape::class,
    'ObjectShape' => ObjectShape::class,
    'OutputShape' => OutputShape::class,
    'OutputTypeTestObj' => OutputTypeTestObj::class,
    'PageInfo' => PageInfo::class,
    'Query' => Query::class,
    'Role' => Role::class,
    'String' => Types\StringType::class,
    'StringTypeEdge' => StringTypeEdge::class,
    'Team' => Team::class,
    'User' => User::class,
    'UserConnection' => UserConnection::class,
    'UserEdge' => UserEdge::class,
    '__Directive' => __Directive::class,
    '__EnumValue' => __EnumValue::class,
    '__Field' => __Field::class,
    '__InputValue' => __InputValue::class,
    '__Schema' => __Schema::class,
    '__Type' => __Type::class,
    '__TypeKind' => __TypeKind::class,
  ];
  const classname<\Slack\GraphQL\Types\ObjectType> QUERY_TYPE = Query::class;
  const classname<\Slack\GraphQL\Types\ObjectType> MUTATION_TYPE = Mutation::class;

  public async function resolveQuery(
    \Graphpinator\Parser\Operation\Operation $operation,
    \Slack\GraphQL\ExecutionContext $context,
  ): Awaitable<GraphQL\ValidFieldResult<?dict<string, mixed>>> {
    return await Query::nullableOutput()->resolveAsync(new GraphQL\Root(), vec[$operation], $context);
  }

  public async function resolveMutation(
    \Graphpinator\Parser\Operation\Operation $operation,
    \Slack\GraphQL\ExecutionContext $context,
  ): Awaitable<GraphQL\ValidFieldResult<?dict<string, mixed>>> {
    return await Mutation::nullableOutput()->resolveAsync(new GraphQL\Root(), vec[$operation], $context);
  }
}
