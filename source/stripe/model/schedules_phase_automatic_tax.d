// File automatically generated from OpenAPI spec.
module stripe.model.schedules_phase_automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SchedulesPhaseAutomaticTax {
  /**
   * Whether Stripe automatically computes tax on invoices created during this phase.
   */
  @optional
  Nullable!(bool) enabled;

}
