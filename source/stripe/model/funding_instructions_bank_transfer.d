// File automatically generated from OpenAPI spec.
module stripe.model.funding_instructions_bank_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.funding_instructions_bank_transfer_financial_address : FundingInstructionsBankTransferFinancialAddress;

/**
 */
class FundingInstructionsBankTransfer {
  /**
   * The bank_transfer type
   */
  @optional
  Nullable!(string) type;

  /**
   * The country of the bank account to fund
   */
  @optional
  Nullable!(string) country;

  /**
   * A list of financial addresses that can be used to fund a particular balance
   */
  @optional
  FundingInstructionsBankTransferFinancialAddress[] financial_addresses;

}
