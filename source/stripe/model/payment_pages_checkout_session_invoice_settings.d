// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_invoice_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.deleted_tax_id : DeletedTaxId;
import stripe.model.invoice_setting_custom_field : InvoiceSettingCustomField;
import stripe.model.invoice_setting_rendering_options : InvoiceSettingRenderingOptions;
import stripe.model.tax_id : TaxId;

/**
 */
class PaymentPagesCheckoutSessionInvoiceSettings {
  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The account tax IDs associated with the invoice.
   */
  @optional
  Json[] account_tax_ids;

  /**
   * Custom fields displayed on the invoice.
   */
  @optional
  InvoiceSettingCustomField[] custom_fields;

  /**
   * Footer displayed on the invoice.
   */
  @optional
  string footer;

  /**
   * Options for invoice PDF rendering.
   */
  @optional
  InvoiceSettingRenderingOptions rendering_options;

  mixin AddBuilder!(typeof(this));

}
