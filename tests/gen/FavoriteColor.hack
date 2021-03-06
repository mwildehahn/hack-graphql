/**
 * This file is generated. Do not modify it manually!
 *
 * To re-generate this file run vendor/bin/hacktest
 *
 *
 * @generated SignedSource<<d0d41c32f3eef2f3de0ccd4ce8efed53>>
 */
namespace Slack\GraphQL\Test\Generated;
use namespace Slack\GraphQL;
use namespace Slack\GraphQL\Types;
use namespace HH\Lib\{C, Dict};

final class FavoriteColor extends \Slack\GraphQL\Types\EnumType {

  const NAME = 'FavoriteColor';
  const type THackType = \FavoriteColor;
  const \HH\enumname<this::THackType> HACK_ENUM = \FavoriteColor::class;
  const vec<GraphQL\Introspection\__EnumValue> ENUM_VALUES = vec[
    shape(
      'name' => 'RED',
      'isDeprecated' => false,
    ),
    shape(
      'name' => 'BLUE',
      'isDeprecated' => false,
    ),
  ];
}
