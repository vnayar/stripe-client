// File automatically generated from OpenAPI spec.
module stripe.model.bank_connections_resource_balance_api_resource_credit_balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class BankConnectionsResourceBalanceApiResourceCreditBalance {
  /**
   * The credit that has been used by the account holder.
   * Each key is a three-letter [ISO currency
   * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
   * Each value is a integer amount. A positive amount indicates money owed to the account holder.
   * A negative amount indicates money owed by the account holder.
   */
  @optional
  Nullable!(int)[string] used;

  mixin AddBuilder!(typeof(this));

}
