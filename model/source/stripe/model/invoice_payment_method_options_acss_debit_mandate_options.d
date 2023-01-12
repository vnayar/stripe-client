// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_acss_debit_mandate_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class InvoicePaymentMethodOptionsAcssDebitMandateOptions {
  /**
   * Transaction type of the mandate.
   */
  @optional
  string transaction_type;

  mixin AddBuilder!(typeof(this));

}
