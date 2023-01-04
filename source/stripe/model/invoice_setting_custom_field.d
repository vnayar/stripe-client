// File automatically generated from OpenAPI spec.
module stripe.model.invoice_setting_custom_field;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoiceSettingCustomField {
  /**
   * The value of the custom field.
   */
  @optional
  string value;

  /**
   * The name of the custom field.
   */
  @optional
  string name;

}
