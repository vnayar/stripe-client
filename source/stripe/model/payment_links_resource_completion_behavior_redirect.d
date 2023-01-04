// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_completion_behavior_redirect;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceCompletionBehaviorRedirect {
  /**
   * The URL the customer will be redirected to after the purchase is complete.
   */
  @optional
  string url;

}
