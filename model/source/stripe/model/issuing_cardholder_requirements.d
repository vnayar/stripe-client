// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_requirements;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingCardholderRequirements {
  /**
   * If `disabled_reason` is present, all cards will decline authorizations with
   * `cardholder_verification_required` reason.
   */
  @optional
  string disabled_reason;

  /**
   * Array of fields that need to be collected in order to verify and re-enable the cardholder.
   */
  @optional
  string[] past_due;

  mixin AddBuilder!(typeof(this));

}
