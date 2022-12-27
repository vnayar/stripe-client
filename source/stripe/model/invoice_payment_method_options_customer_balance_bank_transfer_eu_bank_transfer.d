// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoicePaymentMethodOptionsCustomerBalanceBankTransferEuBankTransfer {
  /**
   * The desired country code of the bank account information. Permitted values include: `DE`,
   * `ES`, `FR`, `IE`, or `NL`.
   */
  @optional
  Nullable!(string) country;

}
