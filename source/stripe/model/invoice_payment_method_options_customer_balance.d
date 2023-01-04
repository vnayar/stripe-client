// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_customer_balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.invoice_payment_method_options_customer_balance_bank_transfer : InvoicePaymentMethodOptionsCustomerBalanceBankTransfer;

/**
 */
class InvoicePaymentMethodOptionsCustomerBalance {
  /**
   * The funding method type to be used when there are not enough funds in the customer balance.
   * Permitted values include: `bank_transfer`.
   */
  @optional
  string funding_type;

  @optional
  InvoicePaymentMethodOptionsCustomerBalanceBankTransfer bank_transfer;

}
