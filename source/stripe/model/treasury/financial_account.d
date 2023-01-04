// File automatically generated from OpenAPI spec.
module stripe.model.treasury.financial_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury.financial_account_features : TreasuryFinancialAccountFeatures;
import stripe.model.treasury_financial_accounts_resource_balance : TreasuryFinancialAccountsResourceBalance;
import stripe.model.treasury_financial_accounts_resource_financial_address : TreasuryFinancialAccountsResourceFinancialAddress;
import stripe.model.treasury_financial_accounts_resource_platform_restrictions : TreasuryFinancialAccountsResourcePlatformRestrictions;
import stripe.model.treasury_financial_accounts_resource_status_details : TreasuryFinancialAccountsResourceStatusDetails;

/**
 * Stripe Treasury provides users with a container for money called a FinancialAccount that is
 * separate from their Payments balance.
 * FinancialAccounts serve as the source and destination of Treasury’s money movement APIs.
 */
class TreasuryFinancialAccount {
  /**
   * The set of functionalities that the platform can restrict on the FinancialAccount.
   */
  @optional
  TreasuryFinancialAccountsResourcePlatformRestrictions platform_restrictions;

  /**
   * Two-letter country code ([ISO 3166-1
   * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
   */
  @optional
  string country;

  @optional
  TreasuryFinancialAccountFeatures features;

  /**
   * The set of credentials that resolve to a FinancialAccount.
   */
  @optional
  TreasuryFinancialAccountsResourceFinancialAddress[] financial_addresses;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The array of paths to pending Features in the Features hash.
   */
  @optional
  string[] pending_features;

  @optional
  TreasuryFinancialAccountsResourceStatusDetails status_details;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The array of paths to restricted Features in the Features hash.
   */
  @optional
  string[] restricted_features;

  @optional
  TreasuryFinancialAccountsResourceBalance balance;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The currencies the FinancialAccount can hold a balance in. Three-letter [ISO currency
   * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
   */
  @optional
  string[] supported_currencies;

  /**
   * The array of paths to active Features in the Features hash.
   */
  @optional
  string[] active_features;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The enum specifying what state the account is in.
   */
  @optional
  string status;

}
