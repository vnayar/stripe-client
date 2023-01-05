// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_flow_subscription_cancel;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PortalFlowsFlowSubscriptionCancel {
  /**
   * The ID of the subscription to be canceled.
   */
  @optional
  string subscription;

  mixin AddBuilder!(typeof(this));

}
