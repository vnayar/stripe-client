// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_consent_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionConsentCollection {
  /**
   * If set to `required`, it requires customers to accept the terms of service before being able
   * to pay.
   */
  @optional
  Nullable!(string) terms_of_service;

  /**
   * If set to `auto`, enables the collection of customer consent for promotional communications.
   * The Checkout
   * Session will determine whether to display an option to opt into promotional communication
   * from the merchant depending on the customer's locale. Only available to US merchants.
   */
  @optional
  Nullable!(string) promotions;

}
