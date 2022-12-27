// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_not_received_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingDisputeNotReceivedEvidence {
  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation
   * supporting the dispute.
   */
  @optional
  Json additional_documentation;

  /**
   * Date when the cardholder expected to receive the product.
   */
  @optional
  Nullable!(long) expected_at;

  /**
   * Description of the merchandise or service that was purchased.
   */
  @optional
  Nullable!(string) product_description;

  /**
   * Whether the product was a merchandise or service.
   */
  @optional
  Nullable!(string) product_type;

  /**
   * Explanation of why the cardholder is disputing this transaction.
   */
  @optional
  Nullable!(string) explanation;

}