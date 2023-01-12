// File automatically generated from OpenAPI spec.
module stripe.model.portal_flows_after_completion_redirect;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PortalFlowsAfterCompletionRedirect {
  /**
   * The URL the customer will be redirected to after the flow is completed.
   */
  @optional
  string return_url;

  mixin AddBuilder!(typeof(this));

}
