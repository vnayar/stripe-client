// File automatically generated from OpenAPI spec.
module stripe.model.financial_reporting_finance_report_run_run_parameters;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class FinancialReportingFinanceReportRunRunParameters {
  /**
   * Connected account ID by which to filter the report run.
   */
  @optional
  string connected_account;

  /**
   * Category of balance transactions to be included in the report run.
   */
  @optional
  string reporting_category;

  /**
   * Starting timestamp of data to be included in the report run.
   */
  @optional
  Nullable!(long) interval_start;

  /**
   * Currency of objects to be included in the report run.
   */
  @optional
  string currency;

  /**
   * Defaults to `Etc/UTC`. The output timezone for all timestamps in the report. A list of
   * possible time zone values is maintained at the [IANA Time Zone
   * Database](http://www.iana.org/time-zones). Has no effect on `interval_start` or
   * `interval_end`.
   */
  @optional
  string timezone;

  /**
   * The set of output columns requested for inclusion in the report run.
   */
  @optional
  string[] columns;

  /**
   * Ending timestamp of data to be included in the report run (exclusive).
   */
  @optional
  Nullable!(long) interval_end;

  /**
   * Payout ID by which to filter the report run.
   */
  @optional
  string payout;

}
