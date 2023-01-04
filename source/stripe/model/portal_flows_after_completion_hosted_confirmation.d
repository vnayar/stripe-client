// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_after_completion_hosted_confirmation;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalFlowsAfterCompletionHostedConfirmation {
  /**
   * A custom message to display to the customer after the flow is completed.
   */
  @optional
  string custom_message;

}
