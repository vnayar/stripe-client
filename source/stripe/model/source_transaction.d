// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.source_transaction_ach_credit_transfer_data : SourceTransactionAchCreditTransferData;
import stripe.model.source_transaction_chf_credit_transfer_data : SourceTransactionChfCreditTransferData;
import stripe.model.source_transaction_gbp_credit_transfer_data : SourceTransactionGbpCreditTransferData;
import stripe.model.source_transaction_paper_check_data : SourceTransactionPaperCheckData;
import stripe.model.source_transaction_sepa_credit_transfer_data : SourceTransactionSepaCreditTransferData;

/**
 * Some payment methods have no required amount that a customer must send.
 * Customers can be instructed to send any amount, and it can be made up of
 * multiple transactions. As such, sources can have multiple associated
 * transactions.
 */
class SourceTransaction {
  @optional
  SourceTransactionAchCreditTransferData ach_credit_transfer;

  /**
   * A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1,
   * Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed
   * to the receiver.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The ID of the source this transaction is attached to.
   */
  @optional
  string source;

  @optional
  SourceTransactionGbpCreditTransferData gbp_credit_transfer;

  @optional
  SourceTransactionSepaCreditTransferData sepa_credit_transfer;

  @optional
  SourceTransactionChfCreditTransferData chf_credit_transfer;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The type of source this transaction is attached to.
   */
  @optional
  string type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  SourceTransactionPaperCheckData paper_check;

  /**
   * The status of the transaction, one of `succeeded`, `pending`, or `failed`.
   */
  @optional
  string status;

}
