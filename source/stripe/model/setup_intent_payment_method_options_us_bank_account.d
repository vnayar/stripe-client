// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.linked_account_options_us_bank_account : LinkedAccountOptionsUsBankAccount;

/**
 */
class SetupIntentPaymentMethodOptionsUsBankAccount {
  /**
   * Bank account verification method.
   */
  @optional
  string verification_method;

  @optional
  LinkedAccountOptionsUsBankAccount financial_connections;

  mixin AddBuilder!(typeof(this));

}
