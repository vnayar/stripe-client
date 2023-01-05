// File automatically generated from OpenAPI spec.
module stripe.model.transfer_schedule;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class TransferSchedule {
  /**
   * The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts
   * scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
   */
  @optional
  Nullable!(int) monthly_anchor;

  /**
   * The number of days charges for the account will be held before being paid out.
   */
  @optional
  Nullable!(int) delay_days;

  /**
   * The day of the week funds will be paid out, of the style 'monday', 'tuesday', etc. Only shown
   * if `interval` is weekly.
   */
  @optional
  string weekly_anchor;

  /**
   * How frequently funds will be paid out. One of `manual` (payouts only created via API call),
   * `daily`, `weekly`, or `monthly`.
   */
  @optional
  string interval;

  mixin AddBuilder!(typeof(this));

}
