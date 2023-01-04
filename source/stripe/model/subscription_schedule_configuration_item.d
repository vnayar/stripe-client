// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedule_configuration_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.deleted_price : DeletedPrice;
import stripe.model.price : Price;
import stripe.model.subscription_item_billing_thresholds : SubscriptionItemBillingThresholds;
import stripe.model.tax_rate : TaxRate;

/**
 * A phase item describes the price and quantity of a phase.
 */
class SubscriptionScheduleConfigurationItem {
  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * item. Metadata on this item will update the underlying subscription item's `metadata` when
   * the phase is entered.
   */
  @optional
  string[string] metadata;

  /**
   * Quantity of the plan to which the customer should be subscribed.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the
   * phase do not apply to this `phase_item`.
   */
  @optional
  TaxRate[] tax_rates;

  /**
   * ID of the price to which the customer should be subscribed.
   */
  @optional
  Json price;

  /**
   * Define thresholds at which an invoice will be sent, and the related subscription advanced to
   * a new billing period
   */
  @optional
  SubscriptionItemBillingThresholds billing_thresholds;

}
