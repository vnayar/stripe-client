// File automatically generated from OpenAPI spec.
module stripe.model.invoices_line_items_credited_items;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoicesLineItemsCreditedItems {
  /**
   * Invoice containing the credited invoice line items
   */
  @optional
  string invoice;

  /**
   * Credited invoice line items
   */
  @optional
  string[] invoice_line_items;

}
