/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<e783aa2cd35435149e850d40f67a79a9>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class OutputShape extends \Slack\GraphQL\Types\ObjectType {

  const NAME = 'OutputShape';
  const type THackType = \TOutputShape;
  const keyset<string> FIELD_NAMES = keyset[
    'string',
    'vec_of_int',
    'nested_shape',
  ];
  const dict<string, classname<Types\InterfaceType>> INTERFACES = dict[
  ];

  public function getFieldDefinition(
    string $field_name,
  ): ?GraphQL\IResolvableFieldDefinition<this::THackType> {
    switch ($field_name) {
      case 'string':
        return new GraphQL\FieldDefinition(
          'string',
          Types\StringType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent['string'],
        );
      case 'vec_of_int':
        return new GraphQL\FieldDefinition(
          'vec_of_int',
          Types\IntType::nonNullable()->nullableOutputListOf(),
          dict[],
          async ($parent, $args, $vars) ==> $parent['vec_of_int'],
        );
      case 'nested_shape':
        return new GraphQL\FieldDefinition(
          'nested_shape',
          NestedOutputShape::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent['nested_shape'],
        );
      default:
        return null;
    }
  }
}
