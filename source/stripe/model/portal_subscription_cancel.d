// File automatically generated from OpenAPI spec.
module stripe.model.portal_subscription_cancel;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.portal_subscription_cancellation_reason : PortalSubscriptionCancellationReason;

/**
 */
class PortalSubscriptionCancel {
  @optional
  PortalSubscriptionCancellationReason cancellation_reason;

  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * Whether to create prorations when canceling subscriptions. Possible values are `none` and
   * `create_prorations`.
   */
  @optional
  string proration_behavior;

  /**
   * Whether to cancel subscriptions immediately or at the end of the billing period.
   */
  @optional
  string mode;

}
