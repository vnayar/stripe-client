// File automatically generated from OpenAPI spec.
module stripe.model.funding_instructions_bank_transfer_iban_record;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Iban Records contain E.U. bank account details per the SEPA format.
 */
class FundingInstructionsBankTransferIbanRecord {
  /**
   * The name of the person or business that owns the bank account
   */
  @optional
  Nullable!(string) account_holder_name;

  /**
   * Two-letter country code ([ISO 3166-1
   * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
   */
  @optional
  Nullable!(string) country;

  /**
   * The BIC/SWIFT code of the account.
   */
  @optional
  Nullable!(string) bic;

  /**
   * The IBAN of the account.
   */
  @optional
  Nullable!(string) iban;

}
