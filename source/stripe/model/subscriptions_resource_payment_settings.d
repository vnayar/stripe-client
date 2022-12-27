// File automatically generated from OpenAPI spec.
module stripe.model.subscriptions_resource_payment_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.subscriptions_resource_payment_method_options : SubscriptionsResourcePaymentMethodOptions;

/**
 */
class SubscriptionsResourcePaymentSettings {
  /**
   * The list of payment method types to provide to every invoice created by the subscription. If
   * not set, Stripe attempts to automatically determine the types to use by looking at the
   * invoice’s default payment method, the subscription’s default payment method, the
   * customer’s default payment method, and your [invoice template
   * settings](https://dashboard.stripe.com/settings/billing/invoice).
   */
  @optional
  Nullable!(string)[] payment_method_types;

  /**
   * Payment-method-specific configuration to provide to invoices created by the subscription.
   */
  @optional
  SubscriptionsResourcePaymentMethodOptions payment_method_options;

  /**
   * Either `off`, or `on_subscription`. With `on_subscription` Stripe updates
   * `subscription.default_payment_method` when a subscription payment succeeds.
   */
  @optional
  Nullable!(string) save_default_payment_method;

}
