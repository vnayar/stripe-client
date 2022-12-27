// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_custom_text;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_pages_checkout_session_custom_text_position : PaymentPagesCheckoutSessionCustomTextPosition;

/**
 */
class PaymentPagesCheckoutSessionCustomText {
  /**
   * Custom text that should be displayed alongside shipping address collection.
   */
  @optional
  PaymentPagesCheckoutSessionCustomTextPosition shipping_address;

  /**
   * Custom text that should be displayed alongside the payment confirmation button.
   */
  @optional
  PaymentPagesCheckoutSessionCustomTextPosition submit;

}
