// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_canceled_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingDisputeCanceledEvidence {
  /**
   * Date when the cardholder expected to receive the product.
   */
  @optional
  Nullable!(long) expected_at;

  /**
   * Description of the merchandise or service that was purchased.
   */
  @optional
  string product_description;

  /**
   * Date when order was canceled.
   */
  @optional
  Nullable!(long) canceled_at;

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
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation
   * supporting the dispute.
   */
  @optional
  Json additional_documentation;

  /**
   * Whether the cardholder was provided with a cancellation policy.
   */
  @optional
  Nullable!(bool) cancellation_policy_provided;

  /**
   * Reason for canceling the order.
   */
  @optional
  string cancellation_reason;

  /**
   * Whether the product was a merchandise or service.
   */
  @optional
  string product_type;

  /**
   * Result of cardholder's attempt to return the product.
   */
  @optional
  string return_status;

  mixin AddBuilder!(typeof(this));

}
