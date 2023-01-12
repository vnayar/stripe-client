// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.setup_intent_payment_method_options_acss_debit : SetupIntentPaymentMethodOptionsAcssDebit;
import stripe.model.setup_intent_payment_method_options_blik : SetupIntentPaymentMethodOptionsBlik;
import stripe.model.setup_intent_payment_method_options_card : SetupIntentPaymentMethodOptionsCard;
import stripe.model.setup_intent_payment_method_options_link : SetupIntentPaymentMethodOptionsLink;
import stripe.model.setup_intent_payment_method_options_sepa_debit : SetupIntentPaymentMethodOptionsSepaDebit;
import stripe.model.setup_intent_payment_method_options_us_bank_account : SetupIntentPaymentMethodOptionsUsBankAccount;
import stripe.model.setup_intent_type_specific_payment_method_options_client : SetupIntentTypeSpecificPaymentMethodOptionsClient;

/**
 */
class SetupIntentPaymentMethodOptions {
  @optional
  SetupIntentPaymentMethodOptionsCard card;

  @optional
  Json link;

  @optional
  Json us_bank_account;

  @optional
  Json acss_debit;

  @optional
  Json blik;

  @optional
  Json sepa_debit;

  mixin AddBuilder!(typeof(this));

}
