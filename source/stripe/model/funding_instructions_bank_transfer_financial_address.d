// File automatically generated from OpenAPI spec.
module stripe.model.funding_instructions_bank_transfer_financial_address;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.funding_instructions_bank_transfer_iban_record : FundingInstructionsBankTransferIbanRecord;
import stripe.model.funding_instructions_bank_transfer_sort_code_record : FundingInstructionsBankTransferSortCodeRecord;
import stripe.model.funding_instructions_bank_transfer_spei_record : FundingInstructionsBankTransferSpeiRecord;
import stripe.model.funding_instructions_bank_transfer_zengin_record : FundingInstructionsBankTransferZenginRecord;

/**
 * FinancialAddresses contain identifying information that resolves to a FinancialAccount.
 */
class FundingInstructionsBankTransferFinancialAddress {
  /**
   * The type of financial address
   */
  @optional
  string type;

  @optional
  FundingInstructionsBankTransferSortCodeRecord sort_code;

  @optional
  FundingInstructionsBankTransferSpeiRecord spei;

  @optional
  FundingInstructionsBankTransferIbanRecord iban;

  @optional
  FundingInstructionsBankTransferZenginRecord zengin;

  /**
   * The payment networks supported by this FinancialAddress
   */
  @optional
  string[] supported_networks;

}
