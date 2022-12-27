// File automatically generated from OpenAPI spec.
module stripe.model.invoices_payment_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.invoices_payment_method_options : InvoicesPaymentMethodOptions;

/**
 */
class InvoicesPaymentSettings {
  /**
   * The list of payment method types (e.g. card) to provide to the invoice’s PaymentIntent. If
   * not set, Stripe attempts to automatically determine the types to use by looking at the
   * invoice’s default payment method, the subscription’s default payment method, the
   * customer’s default payment method, and your [invoice template
   * settings](https://dashboard.stripe.com/settings/billing/invoice).
   */
  @optional
  Nullable!(string)[] payment_method_types;

  /**
   * ID of the mandate to be used for this invoice. It must correspond to the payment method used
   * to pay the invoice, including the invoice's default_payment_method or default_source, if set.
   */
  @optional
  Nullable!(string) default_mandate;

  /**
   * Payment-method-specific configuration to provide to the invoice’s PaymentIntent.
   */
  @optional
  InvoicesPaymentMethodOptions payment_method_options;

}
