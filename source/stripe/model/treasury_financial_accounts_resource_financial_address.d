// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_financial_address;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury_financial_accounts_resource_aba_record : TreasuryFinancialAccountsResourceAbaRecord;

/**
 * FinancialAddresses contain identifying information that resolves to a FinancialAccount.
 */
class TreasuryFinancialAccountsResourceFinancialAddress {
  /**
   * The type of financial address
   */
  @optional
  string type;

  @optional
  TreasuryFinancialAccountsResourceAbaRecord aba;

  /**
   * The list of networks that the address supports
   */
  @optional
  string[] supported_networks;

}
