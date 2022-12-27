// File automatically generated from OpenAPI spec.
module stripe.model.subscriptions_resource_pause_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * The Pause Collection settings determine how we will pause collection for this subscription and
 * for how long the subscription
 * should be paused.
 */
class SubscriptionsResourcePauseCollection {
  /**
   * The time after which the subscription will resume collecting payments.
   */
  @optional
  Nullable!(long) resumes_at;

  /**
   * The payment collection behavior for this subscription while paused. One of `keep_as_draft`,
   * `mark_uncollectible`, or `void`.
   */
  @optional
  Nullable!(string) behavior;

}
