// File automatically generated from OpenAPI spec.
module stripe.model.scheduled_query_run;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;
import stripe.model.sigma_scheduled_query_run_error : SigmaScheduledQueryRunError;

/**
 * If you have [scheduled a Sigma query](https://stripe.com/docs/sigma/scheduled-queries), you'll
 * receive a `sigma.scheduled_query_run.created` webhook each time the query
 * runs. The webhook contains a `ScheduledQueryRun` object, which you can use to
 * retrieve the query results.
 */
class ScheduledQueryRun {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Time at which the result expires and is no longer available for download.
   */
  @optional
  Nullable!(long) result_available_until;

  /**
   * When the query was run, Sigma contained a snapshot of your Stripe data at this time.
   */
  @optional
  Nullable!(long) data_load_time;

  /**
   * SQL for the query.
   */
  @optional
  string sql;

  /**
   * Title of the query.
   */
  @optional
  string title;

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
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  SigmaScheduledQueryRunError error;

  /**
   * The file object representing the results of the query.
   */
  @optional
  File file;

  /**
   * The query's execution status, which will be `completed` for successful runs, and `canceled`,
   * `failed`, or `timed_out` otherwise.
   */
  @optional
  string status;

}
