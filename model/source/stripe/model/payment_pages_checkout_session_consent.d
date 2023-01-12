// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_consent;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionConsent {
  /**
   * If `accepted`, the customer in this Checkout Session has agreed to the merchant's terms of
   * service.
   */
  @optional
  string terms_of_service;

  /**
   * If `opt_in`, the customer consents to receiving promotional communications
   * from the merchant about this Checkout Session.
   */
  @optional
  string promotions;

  mixin AddBuilder!(typeof(this));

}
