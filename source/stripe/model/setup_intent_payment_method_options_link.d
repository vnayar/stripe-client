// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_link;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SetupIntentPaymentMethodOptionsLink {
  /**
   * Token used for persistent Link logins.
   */
  @optional
  string persistent_token;

}
