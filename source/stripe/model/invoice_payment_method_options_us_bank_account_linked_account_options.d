// File automatically generated from OpenAPI spec.
module stripe.model.invoice_payment_method_options_us_bank_account_linked_account_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class InvoicePaymentMethodOptionsUsBankAccountLinkedAccountOptions {
  /**
   * The list of permissions to request. The `payment_method` permission must be included.
   */
  @optional
  string[] permissions;

  mixin AddBuilder!(typeof(this));

}
