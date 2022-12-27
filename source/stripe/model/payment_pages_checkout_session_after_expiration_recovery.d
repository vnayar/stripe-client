// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_after_expiration_recovery;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionAfterExpirationRecovery {
  /**
   * If `true`, a recovery url will be generated to recover this Checkout Session if it
   * expires before a transaction is completed. It will be attached to the
   * Checkout Session object upon expiration.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to
   * `false`
   */
  @optional
  Nullable!(bool) allow_promotion_codes;

  /**
   * The timestamp at which the recovery URL will expire.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * URL that creates a new Checkout Session when clicked that is a copy of this expired Checkout
   * Session
   */
  @optional
  Nullable!(string) url;

}
