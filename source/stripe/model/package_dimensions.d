// File automatically generated from OpenAPI spec.
module stripe.model.package_dimensions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PackageDimensions {
  /**
   * Height, in inches.
   */
  @optional
  Nullable!(float) height;

  /**
   * Length, in inches.
   */
  @optional
  Nullable!(float) length;

  /**
   * Width, in inches.
   */
  @optional
  Nullable!(float) width;

  /**
   * Weight, in ounces.
   */
  @optional
  Nullable!(float) weight;

}
