// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_ach_toggle_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_toggles_setting_status_details : TreasuryFinancialAccountsResourceTogglesSettingStatusDetails;

/**
 * Toggle settings for enabling/disabling an ACH specific feature
 */
class TreasuryFinancialAccountsResourceAchToggleSettings {
  /**
   * Whether the FinancialAccount should have the Feature.
   */
  @optional
  Nullable!(bool) requested;

  /**
   * Whether the Feature is operational.
   */
  @optional
  Nullable!(string) status;

  /**
   * Additional details; includes at least one entry when the status is not `active`.
   */
  @optional
  TreasuryFinancialAccountsResourceTogglesSettingStatusDetails[] status_details;

}
