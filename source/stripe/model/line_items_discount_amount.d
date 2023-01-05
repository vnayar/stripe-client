// File automatically generated from OpenAPI spec.
module stripe.model.line_items_discount_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.discount : Discount;

/**
 */
class LineItemsDiscountAmount {
  /**
   * The amount discounted.
   */
  @optional
  Nullable!(int) amount;

  @optional
  Discount discount;

  mixin AddBuilder!(typeof(this));

}
