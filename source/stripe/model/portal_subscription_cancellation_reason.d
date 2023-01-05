// File automatically generated from OpenAPI spec.
module stripe.model.portal_subscription_cancellation_reason;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PortalSubscriptionCancellationReason {
  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * Which cancellation reasons will be given as options to the customer.
   */
  @optional
  string[] options;

  mixin AddBuilder!(typeof(this));

}
