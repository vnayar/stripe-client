// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_platform_restrictions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Restrictions that a Connect Platform has placed on this FinancialAccount.
 */
class TreasuryFinancialAccountsResourcePlatformRestrictions {
  /**
   * Restricts all inbound money movement.
   */
  @optional
  Nullable!(string) inbound_flows;

  /**
   * Restricts all outbound money movement.
   */
  @optional
  Nullable!(string) outbound_flows;

}
