// File automatically generated from OpenAPI spec.
module stripe.model.sigma_scheduled_query_run_error;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SigmaScheduledQueryRunError {
  /**
   * Information about the run failure.
   */
  @optional
  Nullable!(string) message;

}
