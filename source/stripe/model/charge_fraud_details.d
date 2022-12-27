// File automatically generated from OpenAPI spec.
module stripe.model.charge_fraud_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class ChargeFraudDetails {
  /**
   * Assessments from Stripe. If set, the value is `fraudulent`.
   */
  @optional
  Nullable!(string) stripe_report;

  /**
   * Assessments reported by you. If set, possible values of are `safe` and `fraudulent`.
   */
  @optional
  Nullable!(string) user_report;

}
