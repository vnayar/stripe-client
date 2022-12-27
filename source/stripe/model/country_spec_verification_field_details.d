// File automatically generated from OpenAPI spec.
module stripe.model.country_spec_verification_field_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CountrySpecVerificationFieldDetails {
  /**
   * Fields which every account must eventually provide.
   */
  @optional
  Nullable!(string)[] minimum;

  /**
   * Additional fields which are only required for some users.
   */
  @optional
  Nullable!(string)[] additional;

}
