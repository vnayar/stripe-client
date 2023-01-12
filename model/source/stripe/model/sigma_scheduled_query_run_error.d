// File automatically generated from OpenAPI spec.
module stripe.model.sigma_scheduled_query_run_error;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SigmaScheduledQueryRunError {
  /**
   * Information about the run failure.
   */
  @optional
  string message;

  mixin AddBuilder!(typeof(this));

}
