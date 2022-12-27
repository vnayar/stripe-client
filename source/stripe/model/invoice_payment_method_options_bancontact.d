// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_bancontact;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InvoicePaymentMethodOptionsBancontact {
  /**
   * Preferred language of the Bancontact authorization page that the customer is redirected to.
   */
  @optional
  Nullable!(string) preferred_language;

}
