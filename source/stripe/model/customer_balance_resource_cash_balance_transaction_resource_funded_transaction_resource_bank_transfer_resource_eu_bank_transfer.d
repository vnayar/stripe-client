// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_resource_cash_balance_transaction_resource_funded_transaction_resource_bank_transfer_resource_eu_bank_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class CustomerBalanceResourceCashBalanceTransactionResourceFundedTransactionResourceBankTransferResourceEuBankTransfer {
  /**
   * The full name of the sender, as supplied by the sending bank.
   */
  @optional
  string sender_name;

  /**
   * The last 4 digits of the IBAN of the sender of the funding.
   */
  @optional
  string iban_last4;

  /**
   * The BIC of the bank of the sender of the funding.
   */
  @optional
  string bic;

  mixin AddBuilder!(typeof(this));

}
