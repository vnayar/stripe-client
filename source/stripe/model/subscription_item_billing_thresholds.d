// File automatically generated from OpenAPI spec.
module stripe.model.subscription_item_billing_thresholds;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SubscriptionItemBillingThresholds {
  /**
   * Usage threshold that triggers the subscription to create an invoice
   */
  @optional
  Nullable!(int) usage_gte;

  mixin AddBuilder!(typeof(this));

}
