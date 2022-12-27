// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_custom_text_position;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionCustomTextPosition {
  /**
   * Text may be up to 500 characters in length.
   */
  @optional
  Nullable!(string) message;

}
