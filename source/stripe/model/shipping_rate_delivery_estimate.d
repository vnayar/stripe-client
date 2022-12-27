// File automatically generated from OpenAPI spec.
module stripe.model.shipping_rate_delivery_estimate;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.shipping_rate_delivery_estimate_bound : ShippingRateDeliveryEstimateBound;

/**
 */
class ShippingRateDeliveryEstimate {
  /**
   * The lower bound of the estimated range. If empty, represents no lower bound.
   */
  @optional
  ShippingRateDeliveryEstimateBound minimum;

  /**
   * The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
   */
  @optional
  ShippingRateDeliveryEstimateBound maximum;

}
