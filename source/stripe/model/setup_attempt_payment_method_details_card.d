// File automatically generated from OpenAPI spec.
module stripe.model.setup_attempt_payment_method_details_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.three_d_secure_details : ThreeDSecureDetails;

/**
 */
class SetupAttemptPaymentMethodDetailsCard {
  /**
   * Populated if this authorization used 3D Secure authentication.
   */
  @optional
  ThreeDSecureDetails three_d_secure;

}
