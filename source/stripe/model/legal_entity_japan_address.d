// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_japan_address;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class LegalEntityJapanAddress {
  /**
   * Two-letter country code ([ISO 3166-1
   * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
   */
  @optional
  string country;

  /**
   * Prefecture.
   */
  @optional
  string state;

  /**
   * Block/Building number.
   */
  @optional
  string line1;

  /**
   * Town/cho-me.
   */
  @optional
  string town;

  /**
   * ZIP or postal code.
   */
  @optional
  string postal_code;

  /**
   * City/Ward.
   */
  @optional
  string city;

  /**
   * Building details.
   */
  @optional
  string line2;

}
