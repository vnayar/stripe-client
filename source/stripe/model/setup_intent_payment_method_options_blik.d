// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_blik;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.setup_intent_payment_method_options_mandate_options_blik : SetupIntentPaymentMethodOptionsMandateOptionsBlik;

/**
 */
class SetupIntentPaymentMethodOptionsBlik {
  @optional
  SetupIntentPaymentMethodOptionsMandateOptionsBlik mandate_options;

}
