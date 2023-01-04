// File automatically generated from OpenAPI spec.
module stripe.model.treasury_financial_accounts_resource_aba_record;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * ABA Records contain U.S. bank account details per the ABA format.
 */
class TreasuryFinancialAccountsResourceAbaRecord {
  /**
   * The name of the person or business that owns the bank account.
   */
  @optional
  string account_holder_name;

  /**
   * Routing number for the account.
   */
  @optional
  string routing_number;

  /**
   * Name of the bank.
   */
  @optional
  string bank_name;

  /**
   * The account number.
   */
  @optional
  string account_number;

  /**
   * The last four characters of the account number.
   */
  @optional
  string account_number_last4;

}
