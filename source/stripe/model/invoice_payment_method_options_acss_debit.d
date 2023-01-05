// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice_payment_method_options_acss_debit_mandate_options : InvoicePaymentMethodOptionsAcssDebitMandateOptions;

/**
 */
class InvoicePaymentMethodOptionsAcssDebit {
  @optional
  InvoicePaymentMethodOptionsAcssDebitMandateOptions mandate_options;

  /**
   * Bank account verification method.
   */
  @optional
  string verification_method;

  mixin AddBuilder!(typeof(this));

}
