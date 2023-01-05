// File automatically generated from OpenAPI spec.
module stripe.model.mandate_sepa_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class MandateSepaDebit {
  /**
   * The unique reference of the mandate.
   */
  @optional
  string reference;

  /**
   * The URL of the mandate. This URL generally contains sensitive information about the customer
   * and should be shared with them exclusively.
   */
  @optional
  string url;

  mixin AddBuilder!(typeof(this));

}
