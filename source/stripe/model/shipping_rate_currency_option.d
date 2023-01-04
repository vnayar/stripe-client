// File automatically generated from OpenAPI spec.
module stripe.model.shipping_rate_currency_option;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class ShippingRateCurrencyOption {
  /**
   * A non-negative integer in cents representing how much to charge.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of
   * `inclusive`, `exclusive`, or `unspecified`.
   */
  @optional
  string tax_behavior;

}
