// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedule_current_phase;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SubscriptionScheduleCurrentPhase {
  /**
   * The end of this phase of the subscription schedule.
   */
  @optional
  Nullable!(long) end_date;

  /**
   * The start of this phase of the subscription schedule.
   */
  @optional
  Nullable!(long) start_date;

}
