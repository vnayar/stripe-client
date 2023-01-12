// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_total_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_pages_checkout_session_total_details_resource_breakdown : PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown;

/**
 */
class PaymentPagesCheckoutSessionTotalDetails {
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
  PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown breakdown;

  mixin AddBuilder!(typeof(this));

}
