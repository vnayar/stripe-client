// File automatically generated from OpenAPI spec.
module stripe.model.funding_instructions_bank_transfer_sort_code_record;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Sort Code Records contain U.K. bank account details per the sort code format.
 */
class FundingInstructionsBankTransferSortCodeRecord {
  /**
   * The six-digit sort code
   */
  @optional
  Nullable!(string) sort_code;

  /**
   * The name of the person or business that owns the bank account
   */
  @optional
  Nullable!(string) account_holder_name;

  /**
   * The account number
   */
  @optional
  Nullable!(string) account_number;

}
