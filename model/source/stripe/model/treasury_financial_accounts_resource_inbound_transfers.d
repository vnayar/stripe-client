// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_inbound_transfers;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_ach_toggle_settings : TreasuryFinancialAccountsResourceAchToggleSettings;

/**
 * InboundTransfers contains inbound transfers features for a FinancialAccount.
 */
class TreasuryFinancialAccountsResourceInboundTransfers {
  @optional
  TreasuryFinancialAccountsResourceAchToggleSettings ach;

  mixin AddBuilder!(typeof(this));

}
