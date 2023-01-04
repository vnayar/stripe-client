// File automatically generated from OpenAPI spec.
module stripe.model.address;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class Address {
  /**
   * Address line 1 (e.g., street, PO Box, or company name).
   */
  @optional
  string line1;

  /**
   * Address line 2 (e.g., apartment, suite, unit, or building).
   */
  @optional
  string line2;

  /**
   * Two-letter country code ([ISO 3166-1
   * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
   */
  @optional
  string country;

  /**
   * ZIP or postal code.
   */
  @optional
  string postal_code;

  /**
   * City, district, suburb, town, or village.
   */
  @optional
  string city;

  /**
   * State, county, province, or region.
   */
  @optional
  string state;

}
