// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction_ach_credit_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTransactionAchCreditTransferData {
  /**
   * Last 4 digits of the account number associated with the transfer.
   */
  @optional
  string last4;

  /**
   * Customer data associated with the transfer.
   */
  @optional
  string customer_data;

  /**
   * Routing number associated with the transfer.
   */
  @optional
  string routing_number;

  /**
   * Bank account fingerprint associated with the transfer.
   */
  @optional
  string fingerprint;

  mixin AddBuilder!(typeof(this));

}
