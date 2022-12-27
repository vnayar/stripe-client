// File automatically generated from OpenAPI spec.
module stripe.model.bank_connections_resource_balance_api_resource_cash_balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class BankConnectionsResourceBalanceApiResourceCashBalance {
  /**
   * The funds available to the account holder. Typically this is the current balance less any
   * holds.
   * Each key is a three-letter [ISO currency
   * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
   * Each value is a integer amount. A positive amount indicates money owed to the account holder.
   * A negative amount indicates money owed by the account holder.
   */
  @optional
  Nullable!(int)[string] available;

}
