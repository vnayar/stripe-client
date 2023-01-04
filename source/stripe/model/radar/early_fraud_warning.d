// File automatically generated from OpenAPI spec.
module stripe.model.radar.early_fraud_warning;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.charge : Charge;
import stripe.model.payment_intent : PaymentIntent;

/**
 * An early fraud warning indicates that the card issuer has notified us that a
 * charge may be fraudulent.
 * Related guide: [Early Fraud
 * Warnings](https://stripe.com/docs/disputes/measuring#early-fraud-warnings).
 */
class RadarEarlyFraudWarning {
  /**
   * ID of the Payment Intent this early fraud warning is for, optionally expanded.
   */
  @optional
  Json payment_intent;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The type of fraud labelled by the issuer. One of `card_never_received`,
   * `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`,
   * `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
   */
  @optional
  string fraud_type;

  /**
   * ID of the charge this early fraud warning is for, optionally expanded.
   */
  @optional
  Json charge;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * An EFW is actionable if it has not received a dispute and has not been fully refunded. You
   * may wish to proactively refund a charge that receives an EFW, in order to avoid receiving a
   * dispute later.
   */
  @optional
  Nullable!(bool) actionable;

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

}
