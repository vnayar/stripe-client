// File automatically generated from OpenAPI spec.
module stripe.model.checkout_pix_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CheckoutPixPaymentMethodOptions {
  /**
   * The number of seconds after which Pix payment will expire.
   */
  @optional
  Nullable!(int) expires_after_seconds;

}
