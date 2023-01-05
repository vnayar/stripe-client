// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_type_specific_payment_method_options_client;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SetupIntentTypeSpecificPaymentMethodOptionsClient {
  /**
   * Bank account verification method.
   */
  @optional
  string verification_method;

  mixin AddBuilder!(typeof(this));

}
