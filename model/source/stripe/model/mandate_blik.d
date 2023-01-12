// File automatically generated from OpenAPI spec.
module stripe.model.mandate_blik;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.mandate_options_off_session_details_blik : MandateOptionsOffSessionDetailsBlik;

/**
 */
class MandateBlik {
  /**
   * Type of the mandate.
   */
  @optional
  string type;

  /**
   * Date at which the mandate expires.
   */
  @optional
  Nullable!(long) expires_after;

  @optional
  MandateOptionsOffSessionDetailsBlik off_session;

  mixin AddBuilder!(typeof(this));

}
