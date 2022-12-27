// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_toggles_setting_status_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Additional details on the FinancialAccount Features information.
 */
class TreasuryFinancialAccountsResourceTogglesSettingStatusDetails {
  /**
   * Represents what the user should do, if anything, to activate the Feature.
   */
  @optional
  Nullable!(string) resolution;

  /**
   * Represents the reason why the status is `pending` or `restricted`.
   */
  @optional
  Nullable!(string) code;

  /**
   * The `platform_restrictions` that are restricting this Feature.
   */
  @optional
  Nullable!(string) restriction;

}
