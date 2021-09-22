/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<6735de87aced1c81ab2e5da96041da0d>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class UserEdge extends \Slack\GraphQL\Types\ObjectType {

  const NAME = 'UserEdge';
  const type THackType = \Slack\GraphQL\Pagination\Edge<\User>;
  const keyset<string> FIELD_NAMES = keyset[
    'node',
    'cursor',
  ];
  const dict<string, classname<Types\InterfaceType>> INTERFACES = dict[
  ];

  public function getFieldDefinition(
    string $field_name,
  ): ?GraphQL\IResolvableFieldDefinition<this::THackType> {
    switch ($field_name) {
      case 'node':
        return new GraphQL\FieldDefinition(
          'node',
          User::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getNode(),
          null,
          false,
          null,
        );
      case 'cursor':
        return new GraphQL\FieldDefinition(
          'cursor',
          Types\StringType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getCursor(),
          null,
          false,
          null,
        );
      default:
        return null;
    }
  }
}
