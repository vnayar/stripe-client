// File automatically generated from OpenAPI spec.
module stripe.model.invoices_from_invoice;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice : Invoice;

/**
 */
class InvoicesFromInvoice {
  /**
   * The invoice that was cloned.
   */
  @optional
  Json invoice;

  /**
   * The relation between this invoice and the cloned invoice
   */
  @optional
  string action;

  mixin AddBuilder!(typeof(this));

}
