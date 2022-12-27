// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction_sepa_credit_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTransactionSepaCreditTransferData {
  /**
   * Sender's name.
   */
  @optional
  Nullable!(string) sender_name;

  /**
   * Reference associated with the transfer.
   */
  @optional
  Nullable!(string) reference;

  /**
   * Sender's bank account IBAN.
   */
  @optional
  Nullable!(string) sender_iban;

}
