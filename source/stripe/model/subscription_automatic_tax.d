// File automatically generated from OpenAPI spec.
module stripe.model.subscription_automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SubscriptionAutomaticTax {
  /**
   * Whether Stripe automatically computes tax on this subscription.
   */
  @optional
  Nullable!(bool) enabled;

}
