// File automatically generated from OpenAPI spec.
module stripe.model.account_unification_account_controller;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class AccountUnificationAccountController {
  /**
   * The controller type. Can be `application`, if a Connect application controls the account, or
   * `account`, if the account controls itself.
   */
  @optional
  string type;

  /**
   * `true` if the Connect application retrieving the resource controls the account and can
   * therefore exercise [platform
   * controls](https://stripe.com/docs/connect/platform-controls-for-standard-accounts).
   * Otherwise, this field is null.
   */
  @optional
  Nullable!(bool) is_controller;

  mixin AddBuilder!(typeof(this));

}
