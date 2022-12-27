// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_service_not_as_described_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingDisputeServiceNotAsDescribedEvidence {
  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation
   * supporting the dispute.
   */
  @optional
  Json additional_documentation;

  /**
   * Reason for canceling the order.
   */
  @optional
  Nullable!(string) cancellation_reason;

  /**
   * Date when order was canceled.
   */
  @optional
  Nullable!(long) canceled_at;

  /**
   * Date when the product was received.
   */
  @optional
  Nullable!(long) received_at;

  /**
   * Explanation of why the cardholder is disputing this transaction.
   */
  @optional
  Nullable!(string) explanation;

}
