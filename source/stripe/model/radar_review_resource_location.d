// File automatically generated from OpenAPI spec.
module stripe.model.radar_review_resource_location;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class RadarReviewResourceLocation {
  /**
   * Two-letter ISO code representing the country where the payment originated.
   */
  @optional
  string country;

  /**
   * The city where the payment originated.
   */
  @optional
  string city;

  /**
   * The geographic latitude where the payment originated.
   */
  @optional
  Nullable!(float) latitude;

  /**
   * The geographic longitude where the payment originated.
   */
  @optional
  Nullable!(float) longitude;

  /**
   * The state/county/province/region where the payment originated.
   */
  @optional
  string region;

}
