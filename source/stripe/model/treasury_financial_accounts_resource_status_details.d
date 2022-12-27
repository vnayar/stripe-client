// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_status_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_closed_status_details : TreasuryFinancialAccountsResourceClosedStatusDetails;

/**
 */
class TreasuryFinancialAccountsResourceStatusDetails {
  /**
   * Details related to the closure of this FinancialAccount
   */
  @optional
  TreasuryFinancialAccountsResourceClosedStatusDetails closed;

}
