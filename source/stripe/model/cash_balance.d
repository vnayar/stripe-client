// File automatically generated from OpenAPI spec.
module stripe.model.cash_balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer_balance_customer_balance_settings : CustomerBalanceCustomerBalanceSettings;

/**
 * A customer's `Cash balance` represents real funds. Customers can add funds to their cash
 * balance by sending a bank transfer. These funds can be used for payment and can eventually be
 * paid out to your bank account.
 */
class CashBalance {
  /**
   * The ID of the customer whose cash balance this object represents.
   */
  @optional
  string customer;

  /**
   * A hash of all cash balances available to this customer. You cannot delete a customer with any
   * cash balances, even if the balance is 0. Amounts are represented in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int)[string] available;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  @optional
  CustomerBalanceCustomerBalanceSettings settings;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

}
