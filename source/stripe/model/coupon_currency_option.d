// File automatically generated from OpenAPI spec.
module stripe.model.coupon_currency_option;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class CouponCurrencyOption {
  /**
   * Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for
   * this customer.
   */
  @optional
  Nullable!(int) amount_off;

  mixin AddBuilder!(typeof(this));

}
