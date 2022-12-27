// File automatically generated from OpenAPI spec.
module stripe.model.portal_subscription_pause;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalSubscriptionPause {
  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

}
