/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<c985a69e69b4b26408709e41c2f0d2c5>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class FooObject extends \Slack\GraphQL\Types\ObjectType {

  const NAME = 'FooObject';
  const type THackType = \Foo\FooObject;
  const keyset<string> FIELD_NAMES = keyset[
    'value',
  ];
  const dict<string, classname<Types\InterfaceType>> INTERFACES = dict[
    'FooInterface' => FooInterface::class,
  ];

  public function getFieldDefinition(
    string $field_name,
  ): ?GraphQL\IResolvableFieldDefinition<this::THackType> {
    switch ($field_name) {
      case 'value':
        return new GraphQL\FieldDefinition(
          'value',
          Types\StringType::nullableOutput(),
          dict[],
          async ($parent, $args, $vars) ==> $parent->getValue(),
        );
      default:
        return null;
    }
  }
}
