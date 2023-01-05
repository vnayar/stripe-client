// File automatically generated from OpenAPI spec.
module stripe.model.usage_record_summary;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.period : Period;

/**
 */
class UsageRecordSummary {
  /**
   * The invoice in which this usage period has been billed for.
   */
  @optional
  string invoice;

  @optional
  Period period;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The total usage within this usage period.
   */
  @optional
  Nullable!(int) total_usage;

  /**
   * The ID of the subscription item this summary is describing.
   */
  @optional
  string subscription_item;

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

  mixin AddBuilder!(typeof(this));

}
