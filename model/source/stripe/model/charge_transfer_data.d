// File automatically generated from OpenAPI spec.
module stripe.model.charge_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;

/**
 */
class ChargeTransferData {
  /**
   * The amount transferred to the destination account, if specified. By default, the entire
   * charge amount is transferred to the destination account.
   */
  @optional
  Nullable!(int) amount;

  /**
   * ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was
   * specified in the charge request.
   */
  @optional
  Json destination;

  mixin AddBuilder!(typeof(this));

}
