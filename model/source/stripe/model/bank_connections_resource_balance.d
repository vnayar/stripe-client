// File automatically generated from OpenAPI spec.
module stripe.model.bank_connections_resource_balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.bank_connections_resource_balance_api_resource_cash_balance : BankConnectionsResourceBalanceApiResourceCashBalance;
import stripe.model.bank_connections_resource_balance_api_resource_credit_balance : BankConnectionsResourceBalanceApiResourceCreditBalance;

/**
 */
class BankConnectionsResourceBalance {
  @optional
  BankConnectionsResourceBalanceApiResourceCashBalance cash;

  /**
   * The `type` of the balance. An additional hash is included on the balance with a name matching
   * this value.
   */
  @optional
  string type;

  /**
   * The time that the external institution calculated this balance. Measured in seconds since the
   * Unix epoch.
   */
  @optional
  Nullable!(long) as_of;

  @optional
  BankConnectionsResourceBalanceApiResourceCreditBalance credit;

  /**
   * The balances owed to (or by) the account holder.
   * Each key is a three-letter [ISO currency
   * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
   * Each value is a integer amount. A positive amount indicates money owed to the account holder.
   * A negative amount indicates money owed by the account holder.
   */
  @optional
  Nullable!(int)[string] current;

  mixin AddBuilder!(typeof(this));

}
