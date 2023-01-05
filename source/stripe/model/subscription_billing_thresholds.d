// File automatically generated from OpenAPI spec.
module stripe.model.subscription_billing_thresholds;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SubscriptionBillingThresholds {
  /**
   * Monetary threshold that triggers the subscription to create an invoice
   */
  @optional
  Nullable!(int) amount_gte;

  /**
   * Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true,
   * `billing_cycle_anchor` will be updated to the date/time the threshold was last reached;
   * otherwise, the value will remain unchanged. This value may not be `true` if the subscription
   * contains items with plans that have `aggregate_usage=last_ever`.
   */
  @optional
  Nullable!(bool) reset_billing_cycle_anchor;

  mixin AddBuilder!(typeof(this));

}
