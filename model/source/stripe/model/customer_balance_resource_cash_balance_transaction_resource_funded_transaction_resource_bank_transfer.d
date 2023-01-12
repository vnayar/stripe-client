// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_resource_cash_balance_transaction_resource_funded_transaction_resource_bank_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.customer_balance_resource_cash_balance_transaction_resource_funded_transaction_resource_bank_transfer_resource_eu_bank_transfer : CustomerBalanceResourceCashBalanceTransactionResourceFundedTransactionResourceBankTransferResourceEuBankTransfer;

/**
 */
class CustomerBalanceResourceCashBalanceTransactionResourceFundedTransactionResourceBankTransfer {
  /**
   * The funding method type used to fund the customer balance. Permitted values include:
   * `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, or `mx_bank_transfer`.
   */
  @optional
  string type;

  /**
   * The user-supplied reference field on the bank transfer.
   */
  @optional
  string reference;

  @optional
  CustomerBalanceResourceCashBalanceTransactionResourceFundedTransactionResourceBankTransferResourceEuBankTransfer eu_bank_transfer;

  mixin AddBuilder!(typeof(this));

}
