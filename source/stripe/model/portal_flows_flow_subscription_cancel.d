// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_flow_subscription_cancel;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalFlowsFlowSubscriptionCancel {
  /**
   * The ID of the subscription to be canceled.
   */
  @optional
  Nullable!(string) subscription;

}
