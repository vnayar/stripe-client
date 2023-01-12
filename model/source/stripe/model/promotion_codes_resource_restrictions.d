// File automatically generated from OpenAPI spec.
module stripe.model.promotion_codes_resource_restrictions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.promotion_code_currency_option : PromotionCodeCurrencyOption;

/**
 */
class PromotionCodesResourceRestrictions {
  /**
   * Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount
   */
  @optional
  string minimum_amount_currency;

  /**
   * Promotion code restrictions defined in each available currency option. Each key must be a
   * three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a
   * [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  PromotionCodeCurrencyOption[string] currency_options;

  /**
   * Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be
   * $100 or more to work).
   */
  @optional
  Nullable!(int) minimum_amount;

  /**
   * A Boolean indicating if the Promotion Code should only be redeemed for Customers without any
   * successful payments or invoices
   */
  @optional
  Nullable!(bool) first_time_transaction;

  mixin AddBuilder!(typeof(this));

}
