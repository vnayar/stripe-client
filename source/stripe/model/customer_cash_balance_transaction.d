// File automatically generated from OpenAPI spec.
module stripe.model.customer_cash_balance_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer : Customer;
import stripe.model.customer_balance_resource_cash_balance_transaction_resource_applied_to_payment_transaction : CustomerBalanceResourceCashBalanceTransactionResourceAppliedToPaymentTransaction;
import stripe.model.customer_balance_resource_cash_balance_transaction_resource_funded_transaction : CustomerBalanceResourceCashBalanceTransactionResourceFundedTransaction;
import stripe.model.customer_balance_resource_cash_balance_transaction_resource_refunded_from_payment_transaction : CustomerBalanceResourceCashBalanceTransactionResourceRefundedFromPaymentTransaction;
import stripe.model.customer_balance_resource_cash_balance_transaction_resource_unapplied_from_payment_transaction : CustomerBalanceResourceCashBalanceTransactionResourceUnappliedFromPaymentTransaction;

/**
 * Customers with certain payments enabled have a cash balance, representing funds that were paid
 * by the customer to a merchant, but have not yet been allocated to a payment. Cash Balance
 * Transactions
 * represent when funds are moved into or out of this balance. This includes funding by the
 * customer, allocation
 * to payments, and refunds to the customer.
 */
class CustomerCashBalanceTransaction {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The customer whose available cash balance changed as a result of this transaction.
   */
  @optional
  Json customer;

  /**
   * The total available cash balance for the specified currency after this transaction was
   * applied. Represented in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) ending_balance;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  @optional
  CustomerBalanceResourceCashBalanceTransactionResourceFundedTransaction funded;

  @optional
  CustomerBalanceResourceCashBalanceTransactionResourceUnappliedFromPaymentTransaction unapplied_from_payment;

  @optional
  CustomerBalanceResourceCashBalanceTransactionResourceRefundedFromPaymentTransaction refunded_from_payment;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  @optional
  CustomerBalanceResourceCashBalanceTransactionResourceAppliedToPaymentTransaction applied_to_payment;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The type of the cash balance transaction. One of `applied_to_payment`,
   * `unapplied_from_payment`, `refunded_from_payment`, `funded`, `return_initiated`, or
   * `return_canceled`. New types may be added in future. See [Customer
   * Balance](https://stripe.com/docs/payments/customer-balance#types) to learn more about these
   * types.
   */
  @optional
  string type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The amount by which the cash balance changed, represented in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal). A positive value represents funds
   * being added to the cash balance, a negative value represents funds being removed from the
   * cash balance.
   */
  @optional
  Nullable!(int) net_amount;

}
