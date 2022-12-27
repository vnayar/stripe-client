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
  Nullable!(string) country;

  /**
   * Prefecture.
   */
  @optional
  Nullable!(string) state;

  /**
   * Block/Building number.
   */
  @optional
  Nullable!(string) line1;

  /**
   * Town/cho-me.
   */
  @optional
  Nullable!(string) town;

  /**
   * ZIP or postal code.
   */
  @optional
  Nullable!(string) postal_code;

  /**
   * City/Ward.
   */
  @optional
  Nullable!(string) city;

  /**
   * Building details.
   */
  @optional
  Nullable!(string) line2;

}
