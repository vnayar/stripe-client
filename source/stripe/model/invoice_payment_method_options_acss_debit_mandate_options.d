// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_acss_debit_mandate_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoicePaymentMethodOptionsAcssDebitMandateOptions {
  /**
   * Transaction type of the mandate.
   */
  @optional
  Nullable!(string) transaction_type;

}
