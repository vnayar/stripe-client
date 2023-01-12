// File automatically generated from OpenAPI spec.
module stripe.model.balance_detail;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.balance_amount : BalanceAmount;

/**
 */
class BalanceDetail {
  /**
   * Funds that are available for use.
   */
  @optional
  BalanceAmount[] available;

  mixin AddBuilder!(typeof(this));

}
