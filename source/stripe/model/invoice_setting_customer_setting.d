// File automatically generated from OpenAPI spec.
module stripe.model.invoice_setting_customer_setting;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.invoice_setting_custom_field : InvoiceSettingCustomField;
import stripe.model.invoice_setting_rendering_options : InvoiceSettingRenderingOptions;
import stripe.model.payment_method : PaymentMethod;

/**
 */
class InvoiceSettingCustomerSetting {
  /**
   * Default custom fields to be displayed on invoices for this customer.
   */
  @optional
  InvoiceSettingCustomField[] custom_fields;

  /**
   * ID of a payment method that's attached to the customer, to be used as the customer's default
   * payment method for subscriptions and invoices.
   */
  @optional
  Json default_payment_method;

  /**
   * Default footer to be displayed on invoices for this customer.
   */
  @optional
  Nullable!(string) footer;

  /**
   * Default options for invoice PDF rendering for this customer.
   */
  @optional
  InvoiceSettingRenderingOptions rendering_options;

}
