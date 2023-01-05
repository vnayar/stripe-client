// File automatically generated from OpenAPI spec.
module stripe.model.subscription_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.price : Price;
import stripe.model.subscription_item_billing_thresholds : SubscriptionItemBillingThresholds;
import stripe.model.tax_rate : TaxRate;

/**
 * Subscription items allow you to create customer subscriptions with more than
 * one plan, making it easy to represent complex billing relationships.
 */
class SubscriptionItem {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The `subscription` this `subscription_item` belongs to.
   */
  @optional
  string subscription;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the
   * customer should be subscribed.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * Define thresholds at which an invoice will be sent, and the related subscription advanced to
   * a new billing period
   */
  @optional
  SubscriptionItemBillingThresholds billing_thresholds;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(int) created;

  /**
   * The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on
   * the subscription do not apply to this `subscription_item`.
   */
  @optional
  TaxRate[] tax_rates;

  @optional
  Price price;

  mixin AddBuilder!(typeof(this));

}
