/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<28a23bb2fbfd1ea78d4867cfa9f92f20>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class AlphabetConnection extends \Slack\GraphQL\Types\ObjectType {

  const NAME = 'AlphabetConnection';
  const type THackType = \AlphabetConnection;
  const keyset<string> FIELD_NAMES = keyset[
    'edges',
    'pageInfo',
  ];
  const dict<string, classname<Types\InterfaceType>> INTERFACES = dict[
  ];

  public function getFieldDefinition(
    string $field_name,
  ): ?GraphQL\IResolvableFieldDefinition<this::THackType> {
    switch ($field_name) {
      case 'edges':
        return new GraphQL\FieldDefinition(
          'edges',
          StringTypeEdge::nonNullable()->nullableOutputListOf(),
          dict[],
          async ($parent, $args, $vars) ==> await $parent->getEdges(),
          null,
          null,
        );
      case 'pageInfo':
        return new GraphQL\FieldDefinition(
          'pageInfo',
          PageInfo::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> await $parent->getPageInfo(),
          null,
          null,
        );
      default:
        return null;
    }
  }
}
