// File automatically generated from OpenAPI spec.
module stripe.model.discount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.coupon : Coupon;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.promotion_code : PromotionCode;

/**
 * A discount represents the actual application of a [coupon](https://stripe.com/docs/api#coupons)
 * or [promotion code](https://stripe.com/docs/api#promotion_codes).
 * It contains information about when the discount began, when it will end, and what it is applied
 * to.
 * Related guide: [Applying Discounts to
 * Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
 */
class Discount {
  /**
   * The invoice item `id` (or invoice line item `id` for invoice line items of
   * type='subscription') that the discount's coupon was applied to, if it was applied directly to
   * a particular invoice item or invoice line item.
   */
  @optional
  Nullable!(string) invoice_item;

  /**
   * The invoice that the discount's coupon was applied to, if it was applied directly to a
   * particular invoice.
   */
  @optional
  Nullable!(string) invoice;

  @optional
  Coupon coupon;

  /**
   * The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in
   * API calls to expand discount IDs in an array.
   */
  @optional
  Nullable!(string) id;

  /**
   * Date that the coupon was applied.
   */
  @optional
  Nullable!(long) start;

  /**
   * The ID of the customer associated with this discount.
   */
  @optional
  Json customer;

  /**
   * The subscription that this coupon is applied to, if it is applied to a particular
   * subscription.
   */
  @optional
  Nullable!(string) subscription;

  /**
   * The promotion code applied to create this discount.
   */
  @optional
  Json promotion_code;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * If the coupon has a duration of `repeating`, the date that this discount will end. If the
   * coupon has a duration of `once` or `forever`, this attribute will be null.
   */
  @optional
  Nullable!(long) end;

  /**
   * The Checkout session that this coupon is applied to, if it is applied to a particular session
   * in payment mode. Will not be present for subscription mode.
   */
  @optional
  Nullable!(string) checkout_session;

}
