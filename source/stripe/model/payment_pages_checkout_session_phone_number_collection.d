// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_phone_number_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionPhoneNumberCollection {
  /**
   * Indicates whether phone number collection is enabled for the session
   */
  @optional
  Nullable!(bool) enabled;

}
