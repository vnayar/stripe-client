// File automatically generated from OpenAPI spec.
module stripe.model.invoice_line_item_period;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoiceLineItemPeriod {
  /**
   * The end of the period, which must be greater than or equal to the start.
   */
  @optional
  Nullable!(long) end;

  /**
   * The start of the period.
   */
  @optional
  Nullable!(long) start;

}
