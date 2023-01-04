// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_merchandise_not_as_described_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingDisputeMerchandiseNotAsDescribedEvidence {
  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation
   * supporting the dispute.
   */
  @optional
  Json additional_documentation;

  /**
   * Date when the product was received.
   */
  @optional
  Nullable!(long) received_at;

  /**
   * Result of cardholder's attempt to return the product.
   */
  @optional
  string return_status;

  /**
   * Explanation of why the cardholder is disputing this transaction.
   */
  @optional
  string explanation;

  /**
   * Date when the product was returned or attempted to be returned.
   */
  @optional
  Nullable!(long) returned_at;

  /**
   * Description of the cardholder's attempt to return the product.
   */
  @optional
  string return_description;

}
