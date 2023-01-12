// File automatically generated from OpenAPI spec.
module stripe.model.account_decline_charge_on;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class AccountDeclineChargeOn {
  /**
   * Whether Stripe automatically declines charges with an incorrect CVC. This setting only
   * applies when a CVC is provided and it fails bank verification.
   */
  @optional
  Nullable!(bool) cvc_failure;

  /**
   * Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This
   * setting only applies when a ZIP or postal code is provided and they fail bank verification.
   */
  @optional
  Nullable!(bool) avs_failure;

  mixin AddBuilder!(typeof(this));

}
