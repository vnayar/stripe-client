// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction_gbp_credit_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTransactionGbpCreditTransferData {
  /**
   * The credit transfer rails the sender used to push this transfer. The possible rails are:
   * Faster Payments, BACS, CHAPS, and wire transfers. Currently only Faster Payments is
   * supported.
   */
  @optional
  string funding_method;

  /**
   * Sender account number associated with the transfer.
   */
  @optional
  string sender_account_number;

  /**
   * Last 4 digits of sender account number associated with the transfer.
   */
  @optional
  string last4;

  /**
   * Sender name associated with the transfer.
   */
  @optional
  string sender_name;

  /**
   * Sender entered arbitrary information about the transfer.
   */
  @optional
  string reference;

  /**
   * Sender sort code associated with the transfer.
   */
  @optional
  string sender_sort_code;

  /**
   * Bank account fingerprint associated with the Stripe owned bank account receiving the
   * transfer.
   */
  @optional
  string fingerprint;

}
