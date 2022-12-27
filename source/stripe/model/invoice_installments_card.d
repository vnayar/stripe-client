// File automatically generated from OpenAPI spec.
module stripe.model.invoice_installments_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoiceInstallmentsCard {
  /**
   * Whether Installments are enabled for this Invoice.
   */
  @optional
  Nullable!(bool) enabled;

}
