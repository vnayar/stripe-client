// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_total_details_resource_breakdown;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.line_items_discount_amount : LineItemsDiscountAmount;
import stripe.model.line_items_tax_amount : LineItemsTaxAmount;

/**
 */
class PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown {
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

  mixin AddBuilder!(typeof(this));

}
