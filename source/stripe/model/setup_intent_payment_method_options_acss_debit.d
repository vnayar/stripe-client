// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.setup_intent_payment_method_options_mandate_options_acss_debit : SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit;

/**
 */
class SetupIntentPaymentMethodOptionsAcssDebit {
  @optional
  SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit mandate_options;

  /**
   * Currency supported by the bank account
   */
  @optional
  string currency;

  /**
   * Bank account verification method.
   */
  @optional
  string verification_method;

  mixin AddBuilder!(typeof(this));

}
