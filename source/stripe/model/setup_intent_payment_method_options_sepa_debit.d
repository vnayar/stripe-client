// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_sepa_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.setup_intent_payment_method_options_mandate_options_sepa_debit : SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit;

/**
 */
class SetupIntentPaymentMethodOptionsSepaDebit {
  @optional
  SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit mandate_options;

  mixin AddBuilder!(typeof(this));

}
