// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction_chf_credit_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTransactionChfCreditTransferData {
  /**
   * Sender's name.
   */
  @optional
  string sender_name;

  /**
   * Sender's country address.
   */
  @optional
  string sender_address_country;

  /**
   * Reference associated with the transfer.
   */
  @optional
  string reference;

  /**
   * Sender's bank account IBAN.
   */
  @optional
  string sender_iban;

  /**
   * Sender's line 1 address.
   */
  @optional
  string sender_address_line1;

  mixin AddBuilder!(typeof(this));

}
