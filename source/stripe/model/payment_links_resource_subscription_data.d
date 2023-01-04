// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_subscription_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceSubscriptionData {
  /**
   * The subscription's description, meant to be displayable to the customer. Use this field to
   * optionally store an explanation of the subscription.
   */
  @optional
  string description;

  /**
   * Integer representing the number of trial period days before the customer is charged for the
   * first time.
   */
  @optional
  Nullable!(int) trial_period_days;

}
