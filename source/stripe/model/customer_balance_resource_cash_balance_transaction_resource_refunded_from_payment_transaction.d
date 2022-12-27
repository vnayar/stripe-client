// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_resource_cash_balance_transaction_resource_refunded_from_payment_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.refund : Refund;

/**
 */
class CustomerBalanceResourceCashBalanceTransactionResourceRefundedFromPaymentTransaction {
  /**
   * The [Refund](https://stripe.com/docs/api/refunds/object) that moved these funds into the
   * customer's cash balance.
   */
  @optional
  Json refund;

}
