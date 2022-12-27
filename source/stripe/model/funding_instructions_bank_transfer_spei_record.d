// File automatically generated from OpenAPI spec.
module stripe.model.funding_instructions_bank_transfer_spei_record;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * SPEI Records contain Mexico bank account details per the SPEI format.
 */
class FundingInstructionsBankTransferSpeiRecord {
  /**
   * The short banking institution name
   */
  @optional
  Nullable!(string) bank_name;

  /**
   * The CLABE number
   */
  @optional
  Nullable!(string) clabe;

  /**
   * The three-digit bank code
   */
  @optional
  Nullable!(string) bank_code;

}
