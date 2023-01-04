// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_display_bank_transfer_instructions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.funding_instructions_bank_transfer_financial_address : FundingInstructionsBankTransferFinancialAddress;

/**
 */
class PaymentIntentNextActionDisplayBankTransferInstructions {
  /**
   * Type of bank transfer
   */
  @optional
  string type;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * A list of financial addresses that can be used to fund the customer balance
   */
  @optional
  FundingInstructionsBankTransferFinancialAddress[] financial_addresses;

  /**
   * A link to a hosted page that guides your customer through completing the transfer.
   */
  @optional
  string hosted_instructions_url;

  /**
   * A string identifying this payment. Instruct your customer to include this code in the
   * reference or memo field of their bank transfer.
   */
  @optional
  string reference;

  /**
   * The remaining amount that needs to be transferred to complete the payment.
   */
  @optional
  Nullable!(int) amount_remaining;

}
