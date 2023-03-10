// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_flow;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.portal_flows_flow_after_completion : PortalFlowsFlowAfterCompletion;
import stripe.model.portal_flows_flow_subscription_cancel : PortalFlowsFlowSubscriptionCancel;

/**
 */
class PortalFlowsFlow {
  /**
   * Type of flow that the customer will go through.
   */
  @optional
  string type;

  /**
   * Configuration when `flow.type=subscription_cancel`.
   */
  @optional
  PortalFlowsFlowSubscriptionCancel subscription_cancel;

  @optional
  PortalFlowsFlowAfterCompletion after_completion;

  mixin AddBuilder!(typeof(this));

}
