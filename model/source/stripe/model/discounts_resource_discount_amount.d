// File automatically generated from OpenAPI spec.
module stripe.model.discounts_resource_discount_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.deleted_discount : DeletedDiscount;
import stripe.model.discount : Discount;

/**
 */
class DiscountsResourceDiscountAmount {
  /**
   * The amount, in %s, of the discount.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The discount that was applied to get this discount amount.
   */
  @optional
  Json discount;

  mixin AddBuilder!(typeof(this));

}
