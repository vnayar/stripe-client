// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_shipping_option;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.shipping_rate : ShippingRate;

/**
 */
class PaymentPagesCheckoutSessionShippingOption {
  /**
   * The shipping rate.
   */
  @optional
  Json shipping_rate;

  /**
   * A non-negative integer in cents representing how much to charge.
   */
  @optional
  Nullable!(int) shipping_amount;

}
