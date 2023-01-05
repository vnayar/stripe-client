// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_bancontact;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.mandate : Mandate;
import stripe.model.payment_method : PaymentMethod;

/**
 */
class PaymentMethodDetailsBancontact {
  /**
   * Last four characters of the IBAN.
   */
  @optional
  string iban_last4;

  /**
   * Bank code of bank associated with the bank account.
   */
  @optional
  string bank_code;

  /**
   * Owner's verified full name. Values are verified or provided by Bancontact directly
   * (if supported) at the time of authorization or settlement. They cannot be set or mutated.
   */
  @optional
  string verified_name;

  /**
   * The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
   */
  @optional
  Json generated_sepa_debit_mandate;

  /**
   * The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
   */
  @optional
  Json generated_sepa_debit;

  /**
   * Name of the bank associated with the bank account.
   */
  @optional
  string bank_name;

  /**
   * Bank Identifier Code of the bank associated with the bank account.
   */
  @optional
  string bic;

  /**
   * Preferred language of the Bancontact authorization page that the customer is redirected to.
   * Can be one of `en`, `de`, `fr`, or `nl`
   */
  @optional
  string preferred_language;

  mixin AddBuilder!(typeof(this));

}
