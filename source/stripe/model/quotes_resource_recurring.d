// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_recurring;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.quotes_resource_total_details : QuotesResourceTotalDetails;

/**
 */
class QuotesResourceRecurring {
  /**
   * Total after discounts and taxes are applied.
   */
  @optional
  Nullable!(int) amount_total;

  /**
   * Total before any discounts or taxes are applied.
   */
  @optional
  Nullable!(int) amount_subtotal;

  /**
   * The number of intervals (specified in the `interval` attribute) between subscription
   * billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
   */
  @optional
  Nullable!(int) interval_count;

  @optional
  QuotesResourceTotalDetails total_details;

  /**
   * The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
   */
  @optional
  string interval;

  mixin AddBuilder!(typeof(this));

}
