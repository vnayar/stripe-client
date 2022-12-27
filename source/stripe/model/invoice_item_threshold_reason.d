// File automatically generated from OpenAPI spec.
module stripe.model.invoice_item_threshold_reason;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoiceItemThresholdReason {
  /**
   * The quantity threshold boundary that applied to the given line item.
   */
  @optional
  Nullable!(int) usage_gte;

  /**
   * The IDs of the line items that triggered the threshold invoice.
   */
  @optional
  Nullable!(string)[] line_item_ids;

}
