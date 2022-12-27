// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_fraudulent_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingDisputeFraudulentEvidence {
  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation
   * supporting the dispute.
   */
  @optional
  Json additional_documentation;

  /**
   * Explanation of why the cardholder is disputing this transaction.
   */
  @optional
  Nullable!(string) explanation;

}
