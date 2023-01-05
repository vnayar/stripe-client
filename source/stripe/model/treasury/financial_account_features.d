// File automatically generated from OpenAPI spec.
module stripe.model.treasury.financial_account_features;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_financial_addresses_features : TreasuryFinancialAccountsResourceFinancialAddressesFeatures;
import stripe.model.treasury_financial_accounts_resource_inbound_transfers : TreasuryFinancialAccountsResourceInboundTransfers;
import stripe.model.treasury_financial_accounts_resource_outbound_payments : TreasuryFinancialAccountsResourceOutboundPayments;
import stripe.model.treasury_financial_accounts_resource_outbound_transfers : TreasuryFinancialAccountsResourceOutboundTransfers;
import stripe.model.treasury_financial_accounts_resource_toggle_settings : TreasuryFinancialAccountsResourceToggleSettings;

/**
 * Encodes whether a FinancialAccount has access to a particular Feature, with a `status` enum and
 * associated `status_details`.
 * Stripe or the platform can control Features via the requested field.
 */
class TreasuryFinancialAccountFeatures {
  @optional
  TreasuryFinancialAccountsResourceOutboundPayments outbound_payments;

  @optional
  TreasuryFinancialAccountsResourceFinancialAddressesFeatures financial_addresses;

  @optional
  TreasuryFinancialAccountsResourceToggleSettings card_issuing;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  TreasuryFinancialAccountsResourceToggleSettings deposit_insurance;

  @optional
  TreasuryFinancialAccountsResourceOutboundTransfers outbound_transfers;

  @optional
  TreasuryFinancialAccountsResourceInboundTransfers inbound_transfers;

  @optional
  TreasuryFinancialAccountsResourceToggleSettings intra_stripe_flows;

  mixin AddBuilder!(typeof(this));

}
