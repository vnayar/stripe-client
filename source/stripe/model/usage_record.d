// File automatically generated from OpenAPI spec.
module stripe.model.usage_record;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Usage records allow you to report customer usage and metrics to Stripe for
 * metered billing of subscription prices.
 * Related guide: [Metered
 * Billing](https://stripe.com/docs/billing/subscriptions/metered-billing).
 */
class UsageRecord {
  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The ID of the subscription item this usage record contains data for.
   */
  @optional
  Nullable!(string) subscription_item;

  /**
   * The timestamp when this usage occurred.
   */
  @optional
  Nullable!(long) timestamp;

  /**
   * The usage quantity for the specified date.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

}
