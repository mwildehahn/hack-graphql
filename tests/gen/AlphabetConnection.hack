/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<62edee806dca502f5b400aefff59f52a>>
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
        );
      case 'pageInfo':
        return new GraphQL\FieldDefinition(
          'pageInfo',
          PageInfo::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> await $parent->getPageInfo(),
        );
      default:
        return null;
    }
  }
}
