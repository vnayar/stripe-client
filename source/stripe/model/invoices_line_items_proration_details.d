// File automatically generated from OpenAPI spec.
module stripe.model.invoices_line_items_proration_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.invoices_line_items_credited_items : InvoicesLineItemsCreditedItems;

/**
 */
class InvoicesLineItemsProrationDetails {
  /**
   * For a credit proration `line_item`, the original debit line_items to which the credit
   * proration applies.
   */
  @optional
  InvoicesLineItemsCreditedItems credited_items;

}
