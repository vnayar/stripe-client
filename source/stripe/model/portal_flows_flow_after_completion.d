// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_flow_after_completion;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.portal_flows_after_completion_hosted_confirmation : PortalFlowsAfterCompletionHostedConfirmation;
import stripe.model.portal_flows_after_completion_redirect : PortalFlowsAfterCompletionRedirect;

/**
 */
class PortalFlowsFlowAfterCompletion {
  /**
   * The specified type of behavior after the flow is completed.
   */
  @optional
  string type;

  /**
   * Configuration when `after_completion.type=hosted_confirmation`.
   */
  @optional
  PortalFlowsAfterCompletionHostedConfirmation hosted_confirmation;

  /**
   * Configuration when `after_completion.type=redirect`.
   */
  @optional
  PortalFlowsAfterCompletionRedirect redirect;

  mixin AddBuilder!(typeof(this));

}
