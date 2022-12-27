// File automatically generated from OpenAPI spec.
module stripe.model.mandate_options_off_session_details_blik;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class MandateOptionsOffSessionDetailsBlik {
  /**
   * Amount of each recurring payment.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Currency of each recurring payment.
   */
  @optional
  Nullable!(string) currency;

  /**
   * Frequency indicator of each recurring payment.
   */
  @optional
  Nullable!(int) interval_count;

  /**
   * Frequency interval of each recurring payment.
   */
  @optional
  Nullable!(string) interval;

}
