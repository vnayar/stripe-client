// File automatically generated from OpenAPI spec.
module stripe.model.coupon_applies_to;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class CouponAppliesTo {
  /**
   * A list of product IDs this coupon applies to
   */
  @optional
  string[] products;

  mixin AddBuilder!(typeof(this));

}
