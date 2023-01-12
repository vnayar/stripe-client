// File automatically generated from OpenAPI spec.
module stripe.model.dispute_evidence_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class DisputeEvidenceDetails {
  /**
   * Whether the last evidence submission was submitted past the due date. Defaults to `false` if
   * no evidence submissions have occurred. If `true`, then delivery of the latest evidence is
   * *not* guaranteed.
   */
  @optional
  Nullable!(bool) past_due;

  /**
   * Date by which evidence must be submitted in order to successfully challenge dispute. Will be
   * null if the customer's bank or credit card company doesn't allow a response for this
   * particular dispute.
   */
  @optional
  Nullable!(long) due_by;

  /**
   * Whether evidence has been staged for this dispute.
   */
  @optional
  Nullable!(bool) has_evidence;

  /**
   * The number of times evidence has been submitted. Typically, you may only submit evidence
   * once.
   */
  @optional
  Nullable!(int) submission_count;

  mixin AddBuilder!(typeof(this));

}
