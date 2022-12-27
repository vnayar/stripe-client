// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Balance information for the FinancialAccount
 */
class TreasuryFinancialAccountsResourceBalance {
  /**
   * Funds the user can spend right now.
   */
  @optional
  Nullable!(int)[string] cash;

  /**
   * Funds in the account, but not spendable because they are being held for pending outbound
   * flows.
   */
  @optional
  Nullable!(int)[string] outbound_pending;

  /**
   * Funds not spendable yet, but will become available at a later time.
   */
  @optional
  Nullable!(int)[string] inbound_pending;

}
