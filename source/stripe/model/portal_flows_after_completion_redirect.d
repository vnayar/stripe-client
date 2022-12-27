// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_after_completion_redirect;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalFlowsAfterCompletionRedirect {
  /**
   * The URL the customer will be redirected to after the flow is completed.
   */
  @optional
  Nullable!(string) return_url;

}
