// File automatically generated from OpenAPI spec.
module stripe.model.promotion_code_currency_option;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PromotionCodeCurrencyOption {
  /**
   * Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be
   * $100 or more to work).
   */
  @optional
  Nullable!(int) minimum_amount;

  mixin AddBuilder!(typeof(this));

}
