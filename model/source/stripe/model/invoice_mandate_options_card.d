// File automatically generated from OpenAPI spec.
module stripe.model.invoice_mandate_options_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class InvoiceMandateOptionsCard {
  /**
   * A description of the mandate or subscription that is meant to be displayed to the customer.
   */
  @optional
  string description;

  /**
   * Amount to be charged for future payments.
   */
  @optional
  Nullable!(int) amount;

  /**
   * One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be
   * charged in future payments. If `maximum`, the amount charged can be up to the value passed
   * for the `amount` param.
   */
  @optional
  string amount_type;

  mixin AddBuilder!(typeof(this));

}
