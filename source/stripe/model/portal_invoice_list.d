// File automatically generated from OpenAPI spec.
module stripe.model.portal_invoice_list;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PortalInvoiceList {
  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

  mixin AddBuilder!(typeof(this));

}
