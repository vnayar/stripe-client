// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_financial_addresses_features;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_toggle_settings : TreasuryFinancialAccountsResourceToggleSettings;

/**
 * Settings related to Financial Addresses features on a Financial Account
 */
class TreasuryFinancialAccountsResourceFinancialAddressesFeatures {
  @optional
  TreasuryFinancialAccountsResourceToggleSettings aba;

  mixin AddBuilder!(typeof(this));

}
