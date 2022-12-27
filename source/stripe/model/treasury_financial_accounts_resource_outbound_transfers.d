// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_outbound_transfers;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_ach_toggle_settings : TreasuryFinancialAccountsResourceAchToggleSettings;
import stripe.model.treasury_financial_accounts_resource_toggle_settings : TreasuryFinancialAccountsResourceToggleSettings;

/**
 * OutboundTransfers contains outbound transfers features for a FinancialAccount.
 */
class TreasuryFinancialAccountsResourceOutboundTransfers {
  @optional
  TreasuryFinancialAccountsResourceToggleSettings us_domestic_wire;

  @optional
  TreasuryFinancialAccountsResourceAchToggleSettings ach;

}
