// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_total_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.quotes_resource_total_details_resource_breakdown : QuotesResourceTotalDetailsResourceBreakdown;

/**
 */
class QuotesResourceTotalDetails {
  /**
   * This is the sum of all the shipping amounts.
   */
  @optional
  Nullable!(int) amount_shipping;

  /**
   * This is the sum of all the discounts.
   */
  @optional
  Nullable!(int) amount_discount;

  /**
   * This is the sum of all the tax amounts.
   */
  @optional
  Nullable!(int) amount_tax;

  @optional
  QuotesResourceTotalDetailsResourceBreakdown breakdown;

}
