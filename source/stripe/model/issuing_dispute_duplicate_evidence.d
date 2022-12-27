// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_duplicate_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingDisputeDuplicateEvidence {
  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation
   * supporting the dispute.
   */
  @optional
  Json additional_documentation;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card
   * statement showing that the product had already been paid for.
   */
  @optional
  Json card_statement;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and
   * back of the check that was used to pay for the product.
   */
  @optional
  Json check_image;

  /**
   * Explanation of why the cardholder is disputing this transaction.
   */
  @optional
  Nullable!(string) explanation;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt
   * showing that the product had been paid for in cash.
   */
  @optional
  Json cash_receipt;

  /**
   * Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or
   * more transactions that are copies of each other, this is original undisputed one.
   */
  @optional
  Nullable!(string) original_transaction;

}
