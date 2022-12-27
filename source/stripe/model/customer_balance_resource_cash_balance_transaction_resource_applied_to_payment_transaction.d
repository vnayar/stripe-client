// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_resource_cash_balance_transaction_resource_applied_to_payment_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent : PaymentIntent;

/**
 */
class CustomerBalanceResourceCashBalanceTransactionResourceAppliedToPaymentTransaction {
  /**
   * The [Payment Intent](https://stripe.com/docs/api/payment_intents/object) that funds were
   * applied to.
   */
  @optional
  Json payment_intent;

}
