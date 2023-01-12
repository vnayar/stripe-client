// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice_payment_method_options_us_bank_account_linked_account_options : InvoicePaymentMethodOptionsUsBankAccountLinkedAccountOptions;

/**
 */
class InvoicePaymentMethodOptionsUsBankAccount {
  /**
   * Bank account verification method.
   */
  @optional
  string verification_method;

  @optional
  InvoicePaymentMethodOptionsUsBankAccountLinkedAccountOptions financial_connections;

  mixin AddBuilder!(typeof(this));

}
