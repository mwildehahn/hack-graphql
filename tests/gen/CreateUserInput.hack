/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<86d2f8ea13b22e54fc1a4b72e77ff429>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class CreateUserInput extends \Slack\GraphQL\Types\InputObjectType {

  const NAME = 'CreateUserInput';
  const type THackType = \TCreateUserInput;
  const keyset<string> FIELD_NAMES = keyset [
    'name',
    'is_active',
    'team',
    'favorite_color',
    'roles',
  ];

  <<__Override>>
  public function coerceFieldValues(
    KeyedContainer<arraykey, mixed> $fields,
  ): this::THackType {
    $ret = shape();
    $ret['name'] = Types\StringType::nonNullable()->coerceNamedValue('name', $fields);
    if (C\contains_key($fields, 'is_active')) {
      $ret['is_active'] = Types\BooleanType::nullableInput()->coerceNamedValue('is_active', $fields);
    }
    if (C\contains_key($fields, 'team')) {
      $ret['team'] = CreateTeamInput::nullableInput()->coerceNamedValue('team', $fields);
    }
    if (C\contains_key($fields, 'favorite_color')) {
      $ret['favorite_color'] = FavoriteColor::nullableInput()->coerceNamedValue('favorite_color', $fields);
    }
    if (C\contains_key($fields, 'roles')) {
      $ret['roles'] = Role::nonNullable()->nullableInputListOf()->coerceNamedValue('roles', $fields);
    }
    return $ret;
  }

  <<__Override>>
  public function coerceFieldNodes(
    dict<string, \Graphpinator\Parser\Value\Value> $fields,
    dict<string, mixed> $vars,
  ): this::THackType {
    $ret = shape();
    $ret['name'] = Types\StringType::nonNullable()->coerceNamedNode('name', $fields, $vars);
    if ($this->hasValue('is_active', $fields, $vars)) {
      $ret['is_active'] = Types\BooleanType::nullableInput()->coerceNamedNode('is_active', $fields, $vars);
    }
    if ($this->hasValue('team', $fields, $vars)) {
      $ret['team'] = CreateTeamInput::nullableInput()->coerceNamedNode('team', $fields, $vars);
    }
    if ($this->hasValue('favorite_color', $fields, $vars)) {
      $ret['favorite_color'] = FavoriteColor::nullableInput()->coerceNamedNode('favorite_color', $fields, $vars);
    }
    if ($this->hasValue('roles', $fields, $vars)) {
      $ret['roles'] = Role::nonNullable()->nullableInputListOf()->coerceNamedNode('roles', $fields, $vars);
    }
    return $ret;
  }

  <<__Override>>
  public function assertValidFieldValues(
    KeyedContainer<arraykey, mixed> $fields,
  ): this::THackType {
    $ret = shape();
    $ret['name'] = Types\StringType::nonNullable()->assertValidVariableValue($fields['name']);
    if (C\contains_key($fields, 'is_active')) {
      $ret['is_active'] = Types\BooleanType::nullableInput()->assertValidVariableValue($fields['is_active']);
    }
    if (C\contains_key($fields, 'team')) {
      $ret['team'] = CreateTeamInput::nullableInput()->assertValidVariableValue($fields['team']);
    }
    if (C\contains_key($fields, 'favorite_color')) {
      $ret['favorite_color'] = FavoriteColor::nullableInput()->assertValidVariableValue($fields['favorite_color']);
    }
    if (C\contains_key($fields, 'roles')) {
      $ret['roles'] = Role::nonNullable()->nullableInputListOf()->assertValidVariableValue($fields['roles']);
    }
    return $ret;
  }

  <<__Override>>
  protected function getInputValue(
    string $field_name,
  ): ?GraphQL\Introspection\__InputValue {
    switch ($field_name) {
      case 'name':
        return shape(
          'name' => 'name',
          'type' => Types\StringType::nonNullable(),
        );
      case 'is_active':
        return shape(
          'name' => 'is_active',
          'type' => Types\BooleanType::nullableInput(),
        );
      case 'team':
        return shape(
          'name' => 'team',
          'type' => CreateTeamInput::nullableInput(),
        );
      case 'favorite_color':
        return shape(
          'name' => 'favorite_color',
          'type' => FavoriteColor::nullableInput(),
        );
      case 'roles':
        return shape(
          'name' => 'roles',
          'type' => Role::nonNullable()->nullableInputListOf(),
        );
      default:
        return null;
    }
  }
}
