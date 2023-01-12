// File automatically generated from OpenAPI spec.
module stripe.model.treasury_transactions_resource_balance_impact;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * Change to a FinancialAccount's balance
 */
class TreasuryTransactionsResourceBalanceImpact {
  /**
   * The change made to funds the user can spend right now.
   */
  @optional
  Nullable!(int) cash;

  /**
   * The change made to funds in the account, but not spendable because they are being held for
   * pending outbound flows.
   */
  @optional
  Nullable!(int) outbound_pending;

  /**
   * The change made to funds that are not spendable yet, but will become available at a later
   * time.
   */
  @optional
  Nullable!(int) inbound_pending;

  mixin AddBuilder!(typeof(this));

}
