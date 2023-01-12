// File automatically generated from OpenAPI spec.
module stripe.model.period;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class Period {
  /**
   * The end date of this usage period. All usage up to and including this point in time is
   * included.
   */
  @optional
  Nullable!(long) end;

  /**
   * The start date of this usage period. All usage after this point in time is included.
   */
  @optional
  Nullable!(long) start;

  mixin AddBuilder!(typeof(this));

}
