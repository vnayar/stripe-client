// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_shipping_cost;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.line_items_tax_amount : LineItemsTaxAmount;
import stripe.model.shipping_rate : ShippingRate;

/**
 */
class PaymentPagesCheckoutSessionShippingCost {
  /**
   * The ID of the ShippingRate for this order.
   */
  @optional
  Json shipping_rate;

  /**
   * Total shipping cost after discounts and taxes are applied.
   */
  @optional
  Nullable!(int) amount_total;

  /**
   * Total shipping cost before any discounts or taxes are applied.
   */
  @optional
  Nullable!(int) amount_subtotal;

  /**
   * The taxes applied to the shipping rate.
   */
  @optional
  LineItemsTaxAmount[] taxes;

  /**
   * Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
   */
  @optional
  Nullable!(int) amount_tax;

}
