/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<8effc458f88d700e19fc5f34452ec88f>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class Mutation extends \Slack\GraphQL\Types\ObjectType {

  const NAME = 'Mutation';
  const type THackType = \Slack\GraphQL\Root;
  const keyset<string> FIELD_NAMES = keyset[
    'createUser',
    'pokeUser',
  ];
  const dict<string, classname<Types\InterfaceType>> INTERFACES = dict[
  ];

  public function getFieldDefinition(
    string $field_name,
  ): ?GraphQL\IResolvableFieldDefinition<this::THackType> {
    switch ($field_name) {
      case 'createUser':
        return new GraphQL\FieldDefinition(
          'createUser',
          User::nullableOutput(),
          dict[
            'input' => shape(
              'name' => 'input',
              'type' => CreateUserInput::nonNullable(),
            ),
          ],
          async ($parent, $args, $vars) ==> await \UserMutationAttributes::createUser(
            CreateUserInput::nonNullable()->coerceNamedNode('input', $args, $vars),
          ),
        );
      case 'pokeUser':
        return new GraphQL\FieldDefinition(
          'pokeUser',
          User::nullableOutput(),
          dict[
            'id' => shape(
              'name' => 'id',
              'type' => Types\IntType::nonNullable(),
            ),
          ],
          async ($parent, $args, $vars) ==> await \UserMutationAttributes::pokeUser(
            Types\IntType::nonNullable()->coerceNamedNode('id', $args, $vars),
          ),
        );
      default:
        return null;
    }
  }
}
