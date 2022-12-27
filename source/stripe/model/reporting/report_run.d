// File automatically generated from OpenAPI spec.
module stripe.model.reporting.report_run;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;
import stripe.model.financial_reporting_finance_report_run_run_parameters : FinancialReportingFinanceReportRunRunParameters;

/**
 * The Report Run object represents an instance of a report type generated with
 * specific run parameters. Once the object is created, Stripe begins processing the report.
 * When the report has finished running, it will give you a reference to a file
 * where you can retrieve your results. For an overview, see
 * [API Access to Reports](https://stripe.com/docs/reporting/statements/api).
 * Note that certain report types can only be run based on your live-mode data (not test-mode
 * data), and will error when queried without a [live-mode API
 * key](https://stripe.com/docs/keys#test-live-modes).
 */
class ReportingReportRun {
  @optional
  FinancialReportingFinanceReportRunRunParameters parameters;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The file object representing the result of the report run (populated when
   *  `status=succeeded`).
   */
  @optional
  File result;

  /**
   * `true` if the report is run on live mode data and `false` if it is run on test mode data.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The ID of the [report type](https://stripe.com/docs/reports/report-types) to run, such as
   * `"balance.summary.1"`.
   */
  @optional
  Nullable!(string) report_type;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Timestamp at which this run successfully finished (populated when
   *  `status=succeeded`). Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) succeeded_at;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * If something should go wrong during the run, a message about the failure (populated when
   *  `status=failed`).
   */
  @optional
  Nullable!(string) error;

  /**
   * Status of this report run. This will be `pending` when the run is initially created.
   *  When the run finishes, this will be set to `succeeded` and the `result` field will be
   * populated.
   *  Rarely, we may encounter an error, at which point this will be set to `failed` and the
   * `error` field will be populated.
   */
  @optional
  Nullable!(string) status;

}
