// File automatically generated from OpenAPI spec.
module stripe.model.shipping_rate_delivery_estimate_bound;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class ShippingRateDeliveryEstimateBound {
  /**
   * A unit of time.
   */
  @optional
  string unit;

  /**
   * Must be greater than 0.
   */
  @optional
  Nullable!(int) value;

}
