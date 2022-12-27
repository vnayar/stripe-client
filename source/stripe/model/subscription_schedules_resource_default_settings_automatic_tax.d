// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedules_resource_default_settings_automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SubscriptionSchedulesResourceDefaultSettingsAutomaticTax {
  /**
   * Whether Stripe automatically computes tax on invoices created during this phase.
   */
  @optional
  Nullable!(bool) enabled;

}
