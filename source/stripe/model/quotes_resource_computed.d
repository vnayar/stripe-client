// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_computed;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.quotes_resource_recurring : QuotesResourceRecurring;
import stripe.model.quotes_resource_upfront : QuotesResourceUpfront;

/**
 */
class QuotesResourceComputed {
  /**
   * The definitive totals and line items the customer will be charged on a recurring basis. Takes
   * into account the line items with recurring prices and discounts with `duration=forever`
   * coupons only. Defaults to `null` if no inputted line items with recurring prices.
   */
  @optional
  QuotesResourceRecurring recurring;

  @optional
  QuotesResourceUpfront upfront;

  mixin AddBuilder!(typeof(this));

}
