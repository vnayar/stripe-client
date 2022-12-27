// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_resource_cash_balance_transaction_resource_funded_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer_balance_resource_cash_balance_transaction_resource_funded_transaction_resource_bank_transfer : CustomerBalanceResourceCashBalanceTransactionResourceFundedTransactionResourceBankTransfer;

/**
 */
class CustomerBalanceResourceCashBalanceTransactionResourceFundedTransaction {
  @optional
  CustomerBalanceResourceCashBalanceTransactionResourceFundedTransactionResourceBankTransfer bank_transfer;

}
