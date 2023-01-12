// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_outbound_payments;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_ach_toggle_settings : TreasuryFinancialAccountsResourceAchToggleSettings;
import stripe.model.treasury_financial_accounts_resource_toggle_settings : TreasuryFinancialAccountsResourceToggleSettings;

/**
 * Settings related to Outbound Payments features on a Financial Account
 */
class TreasuryFinancialAccountsResourceOutboundPayments {
  @optional
  TreasuryFinancialAccountsResourceToggleSettings us_domestic_wire;

  @optional
  TreasuryFinancialAccountsResourceAchToggleSettings ach;

  mixin AddBuilder!(typeof(this));

}
