// File automatically generated from OpenAPI spec.
module stripe.model.coupon;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.coupon_applies_to : CouponAppliesTo;
import stripe.model.coupon_currency_option : CouponCurrencyOption;

/**
 * A coupon contains information about a percent-off or amount-off discount you
 * might want to apply to a customer. Coupons may be applied to
 * [subscriptions](https://stripe.com/docs/api#subscriptions),
 * [invoices](https://stripe.com/docs/api#invoices),
 * [checkout sessions](https://stripe.com/docs/api/checkout/sessions),
 * [quotes](https://stripe.com/docs/api#quotes), and more. Coupons do not work with conventional
 * one-off [charges](https://stripe.com/docs/api#create_charge) or [payment
 * intents](https://stripe.com/docs/api/payment_intents).
 */
class Coupon {
  /**
   * Number of times this coupon has been applied to a customer.
   */
  @optional
  Nullable!(int) times_redeemed;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Maximum number of times this coupon can be redeemed, in total, across all customers, before
   * it is no longer valid.
   */
  @optional
  Nullable!(int) max_redemptions;

  /**
   * If `amount_off` has been set, the three-letter [ISO code for the
   * currency](https://stripe.com/docs/currencies) of the amount to take off.
   */
  @optional
  string currency;

  /**
   * Name of the coupon displayed to customers on for instance invoices or receipts.
   */
  @optional
  string name;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for
   * this customer.
   */
  @optional
  Nullable!(int) amount_off;

  /**
   * Date after which the coupon can no longer be redeemed.
   */
  @optional
  Nullable!(long) redeem_by;

  @optional
  CouponAppliesTo applies_to;

  /**
   * One of `forever`, `once`, and `repeating`. Describes how long a customer who applies this
   * coupon will get the discount.
   */
  @optional
  string duration;

  /**
   * Percent that will be taken off the subtotal of any invoices for this customer for the
   * duration of the coupon. For example, a coupon with percent_off of 50 will make a %s100
   * invoice %s50 instead.
   */
  @optional
  Nullable!(float) percent_off;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * If `duration` is `repeating`, the number of months the coupon applies. Null if coupon
   * `duration` is `forever` or `once`.
   */
  @optional
  Nullable!(int) duration_in_months;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Coupons defined in each available currency option. Each key must be a three-letter [ISO
   * currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported
   * currency](https://stripe.com/docs/currencies).
   */
  @optional
  CouponCurrencyOption[string] currency_options;

  /**
   * Taking account of the above properties, whether this coupon can still be applied to a
   * customer.
   */
  @optional
  Nullable!(bool) valid;

}
