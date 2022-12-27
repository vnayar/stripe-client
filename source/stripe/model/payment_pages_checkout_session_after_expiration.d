// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_after_expiration;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_pages_checkout_session_after_expiration_recovery : PaymentPagesCheckoutSessionAfterExpirationRecovery;

/**
 */
class PaymentPagesCheckoutSessionAfterExpiration {
  /**
   * When set, configuration used to recover the Checkout Session on expiry.
   */
  @optional
  PaymentPagesCheckoutSessionAfterExpirationRecovery recovery;

}
