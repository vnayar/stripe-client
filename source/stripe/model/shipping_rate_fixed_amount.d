// File automatically generated from OpenAPI spec.
module stripe.model.shipping_rate_fixed_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.shipping_rate_currency_option : ShippingRateCurrencyOption;

/**
 */
class ShippingRateFixedAmount {
  /**
   * A non-negative integer in cents representing how much to charge.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Shipping rates defined in each available currency option. Each key must be a three-letter
   * [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported
   * currency](https://stripe.com/docs/currencies).
   */
  @optional
  ShippingRateCurrencyOption[string] currency_options;

}
