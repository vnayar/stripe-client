// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_subscription_data_subscription_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class QuotesResourceSubscriptionDataSubscriptionData {
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

  /**
   * When creating a new subscription, the date of which the subscription schedule will start
   * after the quote is accepted. This date is ignored if it is in the past when the quote is
   * accepted. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) effective_date;

}
