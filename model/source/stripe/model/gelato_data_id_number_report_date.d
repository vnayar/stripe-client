// File automatically generated from OpenAPI spec.
module stripe.model.gelato_data_id_number_report_date;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * Point in Time
 */
class GelatoDataIdNumberReportDate {
  /**
   * The four-digit year.
   */
  @optional
  Nullable!(int) year;

  /**
   * Numerical month between 1 and 12.
   */
  @optional
  Nullable!(int) month;

  /**
   * Numerical day between 1 and 31.
   */
  @optional
  Nullable!(int) day;

  mixin AddBuilder!(typeof(this));

}
