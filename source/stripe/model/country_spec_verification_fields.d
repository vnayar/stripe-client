// File automatically generated from OpenAPI spec.
module stripe.model.country_spec_verification_fields;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.country_spec_verification_field_details : CountrySpecVerificationFieldDetails;

/**
 */
class CountrySpecVerificationFields {
  @optional
  CountrySpecVerificationFieldDetails individual;

  @optional
  CountrySpecVerificationFieldDetails company;

}
