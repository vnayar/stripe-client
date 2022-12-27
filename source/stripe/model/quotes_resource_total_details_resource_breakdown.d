// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_total_details_resource_breakdown;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.line_items_discount_amount : LineItemsDiscountAmount;
import stripe.model.line_items_tax_amount : LineItemsTaxAmount;

/**
 */
class QuotesResourceTotalDetailsResourceBreakdown {
  /**
   * The aggregated tax amounts by rate.
   */
  @optional
  LineItemsTaxAmount[] taxes;

  /**
   * The aggregated discounts.
   */
  @optional
  LineItemsDiscountAmount[] discounts;

}
