// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class QuotesResourceStatusTransitions {
  /**
   * The time that the quote was accepted. Measured in seconds since Unix epoch.
   */
  @optional
  Nullable!(long) accepted_at;

  /**
   * The time that the quote was finalized. Measured in seconds since Unix epoch.
   */
  @optional
  Nullable!(long) finalized_at;

  /**
   * The time that the quote was canceled. Measured in seconds since Unix epoch.
   */
  @optional
  Nullable!(long) canceled_at;

}
