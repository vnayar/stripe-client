// File automatically generated from OpenAPI spec.
module stripe.model.gelato_verified_outputs;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.gelato_data_verified_outputs_date : GelatoDataVerifiedOutputsDate;

/**
 */
class GelatoVerifiedOutputs {
  /**
   * The user’s verified date of birth.
   */
  @optional
  GelatoDataVerifiedOutputsDate dob;

  /**
   * The user's verified last name.
   */
  @optional
  string last_name;

  /**
   * The user's verified address.
   */
  @optional
  Address address;

  /**
   * The user's verified id number type.
   */
  @optional
  string id_number_type;

  /**
   * The user's verified id number.
   */
  @optional
  string id_number;

  /**
   * The user's verified first name.
   */
  @optional
  string first_name;

}
