// File automatically generated from OpenAPI spec.
module stripe.model.invoice_setting_rendering_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoiceSettingRenderingOptions {
  /**
   * How line-item prices and amounts will be displayed with respect to tax on invoice PDFs.
   */
  @optional
  Nullable!(string) amount_tax_display;

}
