// File automatically generated from OpenAPI spec.
module stripe.model.funding_instructions_bank_transfer_zengin_record;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Zengin Records contain Japan bank account details per the Zengin format.
 */
class FundingInstructionsBankTransferZenginRecord {
  /**
   * The account number
   */
  @optional
  string account_number;

  /**
   * The bank code of the account
   */
  @optional
  string bank_code;

  /**
   * The branch code of the account
   */
  @optional
  string branch_code;

  /**
   * The account holder name
   */
  @optional
  string account_holder_name;

  /**
   * The bank name of the account
   */
  @optional
  string bank_name;

  /**
   * The branch name of the account
   */
  @optional
  string branch_name;

  /**
   * The bank account type. In Japan, this can only be `futsu` or `toza`.
   */
  @optional
  string account_type;

}
