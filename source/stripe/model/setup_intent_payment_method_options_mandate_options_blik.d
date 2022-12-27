// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_mandate_options_blik;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.mandate_options_off_session_details_blik : MandateOptionsOffSessionDetailsBlik;

/**
 */
class SetupIntentPaymentMethodOptionsMandateOptionsBlik {
  /**
   * Type of the mandate.
   */
  @optional
  Nullable!(string) type;

  /**
   * Date at which the mandate expires.
   */
  @optional
  Nullable!(long) expires_after;

  @optional
  MandateOptionsOffSessionDetailsBlik off_session;

}
