// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_customer_balance_bank_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer : InvoicePaymentMethodOptionsCustomerBalanceBankTransferEuBankTransfer;

/**
 */
class InvoicePaymentMethodOptionsCustomerBalanceBankTransfer {
  /**
   * The bank transfer type that can be used for funding. Permitted values include:
   * `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, or `mx_bank_transfer`.
   */
  @optional
  string type;

  @optional
  InvoicePaymentMethodOptionsCustomerBalanceBankTransferEuBankTransfer eu_bank_transfer;

  mixin AddBuilder!(typeof(this));

}
