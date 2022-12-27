// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_invoice_creation;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_pages_checkout_session_invoice_settings : PaymentPagesCheckoutSessionInvoiceSettings;

/**
 */
class PaymentPagesCheckoutSessionInvoiceCreation {
  /**
   * Indicates whether invoice creation is enabled for the Checkout Session.
   */
  @optional
  Nullable!(bool) enabled;

  @optional
  PaymentPagesCheckoutSessionInvoiceSettings invoice_data;

}
