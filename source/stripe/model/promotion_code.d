// File automatically generated from OpenAPI spec.
module stripe.model.promotion_code;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.coupon : Coupon;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.promotion_codes_resource_restrictions : PromotionCodesResourceRestrictions;

/**
 * A Promotion Code represents a customer-redeemable code for a
 * [coupon](https://stripe.com/docs/api#coupons). It can be used to
 * create multiple codes for a single coupon.
 */
class PromotionCode {
  @optional
  PromotionCodesResourceRestrictions restrictions;

  /**
   * Number of times this promotion code has been used.
   */
  @optional
  Nullable!(int) times_redeemed;

  @optional
  Coupon coupon;

  /**
   * Date at which the promotion code can no longer be redeemed.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * The customer-facing code. Regardless of case, this code must be unique across all active
   * promotion codes for each customer.
   */
  @optional
  string code;

  /**
   * The customer that this promotion code can be used by.
   */
  @optional
  Json customer;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Maximum number of times this promotion code can be redeemed.
   */
  @optional
  Nullable!(int) max_redemptions;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Whether the promotion code is currently active. A promotion code is only active if the coupon
   * is also valid.
   */
  @optional
  Nullable!(bool) active;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

}
