// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_closed_status_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryFinancialAccountsResourceClosedStatusDetails {
  /**
   * The array that contains reasons for a FinancialAccount closure.
   */
  @optional
  Nullable!(string)[] reasons;

}
