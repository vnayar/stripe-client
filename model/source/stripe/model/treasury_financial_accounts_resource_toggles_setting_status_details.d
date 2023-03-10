// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_toggles_setting_status_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * Additional details on the FinancialAccount Features information.
 */
class TreasuryFinancialAccountsResourceTogglesSettingStatusDetails {
  /**
   * Represents what the user should do, if anything, to activate the Feature.
   */
  @optional
  string resolution;

  /**
   * Represents the reason why the status is `pending` or `restricted`.
   */
  @optional
  string code;

  /**
   * The `platform_restrictions` that are restricting this Feature.
   */
  @optional
  string restriction;

  mixin AddBuilder!(typeof(this));

}
