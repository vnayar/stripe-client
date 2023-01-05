// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_company;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingCardholderCompany {
  /**
   * Whether the company's business ID number was provided.
   */
  @optional
  Nullable!(bool) tax_id_provided;

  mixin AddBuilder!(typeof(this));

}
