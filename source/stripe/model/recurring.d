// File automatically generated from OpenAPI spec.
module stripe.model.recurring;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class Recurring {
  /**
   * Specifies a usage aggregation strategy for prices of `usage_type=metered`. Allowed values are
   * `sum` for summing up all usage during a period, `last_during_period` for using the last usage
   * record reported within a period, `last_ever` for using the last usage record ever (across
   * period bounds) or `max` which uses the usage record with the maximum reported usage during a
   * period. Defaults to `sum`.
   */
  @optional
  string aggregate_usage;

  /**
   * The number of intervals (specified in the `interval` attribute) between subscription
   * billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
   */
  @optional
  Nullable!(int) interval_count;

  /**
   * Configures how the quantity per period should be determined. Can be either `metered` or
   * `licensed`. `licensed` automatically bills the `quantity` set when adding it to a
   * subscription. `metered` aggregates the total usage based on usage records. Defaults to
   * `licensed`.
   */
  @optional
  string usage_type;

  /**
   * The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
   */
  @optional
  string interval;

}
