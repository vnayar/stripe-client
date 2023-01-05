// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.issuing_dispute_canceled_evidence : IssuingDisputeCanceledEvidence;
import stripe.model.issuing_dispute_duplicate_evidence : IssuingDisputeDuplicateEvidence;
import stripe.model.issuing_dispute_fraudulent_evidence : IssuingDisputeFraudulentEvidence;
import stripe.model.issuing_dispute_merchandise_not_as_described_evidence : IssuingDisputeMerchandiseNotAsDescribedEvidence;
import stripe.model.issuing_dispute_not_received_evidence : IssuingDisputeNotReceivedEvidence;
import stripe.model.issuing_dispute_other_evidence : IssuingDisputeOtherEvidence;
import stripe.model.issuing_dispute_service_not_as_described_evidence : IssuingDisputeServiceNotAsDescribedEvidence;

/**
 */
class IssuingDisputeEvidence {
  @optional
  IssuingDisputeCanceledEvidence canceled;

  /**
   * The reason for filing the dispute. Its value will match the field containing the evidence.
   */
  @optional
  string reason;

  @optional
  IssuingDisputeMerchandiseNotAsDescribedEvidence merchandise_not_as_described;

  @optional
  IssuingDisputeOtherEvidence other;

  @optional
  IssuingDisputeServiceNotAsDescribedEvidence service_not_as_described;

  @optional
  IssuingDisputeFraudulentEvidence fraudulent;

  @optional
  IssuingDisputeDuplicateEvidence duplicate;

  @optional
  IssuingDisputeNotReceivedEvidence not_received;

  mixin AddBuilder!(typeof(this));

}
