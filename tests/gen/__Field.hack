/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<7a4c88e2f4532732ddad9264db61c821>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class __Field extends \Slack\GraphQL\Types\ObjectType {

  const NAME = '__Field';
  const type THackType = \Slack\GraphQL\Introspection\__Field;
  const keyset<string> FIELD_NAMES = keyset[
    'args',
    'deprecationReason',
    'description',
    'isDeprecated',
    'name',
    'type',
  ];
  const dict<string, classname<Types\InterfaceType>> INTERFACES = dict[
  ];

  public function getFieldDefinition(
    string $field_name,
  ): ?GraphQL\IResolvableFieldDefinition<this::THackType> {
    switch ($field_name) {
      case 'args':
        return new GraphQL\FieldDefinition(
          'args',
          __InputValue::nonNullable()->nullableOutputListOf(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getArgs(),
          'Args of the field',
          false,
          null,
        );
      case 'deprecationReason':
        return new GraphQL\FieldDefinition(
          'deprecationReason',
          Types\StringType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getDeprecationReason(),
          'Reason the field was deprecated',
          false,
          null,
        );
      case 'description':
        return new GraphQL\FieldDefinition(
          'description',
          Types\StringType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getDescription(),
          'Description of the field',
          false,
          null,
        );
      case 'isDeprecated':
        return new GraphQL\FieldDefinition(
          'isDeprecated',
          Types\BooleanType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->isDeprecated(),
          'Boolean for whether or not the field is deprecated',
          false,
          null,
        );
      case 'name':
        return new GraphQL\FieldDefinition(
          'name',
          Types\StringType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getName(),
          'Name of the field',
          false,
          null,
        );
      case 'type':
        return new GraphQL\FieldDefinition(
          'type',
          __Type::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getType(),
          'Type of the field',
          false,
          null,
        );
      default:
        return null;
    }
  }
}
