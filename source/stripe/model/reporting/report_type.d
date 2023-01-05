// File automatically generated from OpenAPI spec.
module stripe.model.reporting.report_type;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * The Report Type resource corresponds to a particular type of report, such as
 * the "Activity summary" or "Itemized payouts" reports. These objects are
 * identified by an ID belonging to a set of enumerated values. See
 * [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api)
 * for those Report Type IDs, along with required and optional parameters.
 * Note that certain report types can only be run based on your live-mode data (not test-mode
 * data), and will error when queried without a [live-mode API
 * key](https://stripe.com/docs/keys#test-live-modes).
 */
class ReportingReportType {
  /**
   * The [ID of the Report
   * Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as
   * `balance.summary.1`.
   */
  @optional
  string id;

  /**
   * List of column names that are included by default when this Report Type gets run. (If the
   * Report Type doesn't support the `columns` parameter, this will be null.)
   */
  @optional
  string[] default_columns;

  /**
   * Most recent time for which this Report Type is available. Measured in seconds since the Unix
   * epoch.
   */
  @optional
  Nullable!(long) data_available_end;

  /**
   * Earliest time for which this Report Type is available. Measured in seconds since the Unix
   * epoch.
   */
  @optional
  Nullable!(long) data_available_start;

  /**
   * Human-readable name of the Report Type
   */
  @optional
  string name;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * When this Report Type was latest updated. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) updated;

  /**
   * Version of the Report Type. Different versions report with the same ID will have the same
   * purpose, but may take different run parameters or have different result schemas.
   */
  @optional
  Nullable!(int) version_;

  mixin AddBuilder!(typeof(this));

}
