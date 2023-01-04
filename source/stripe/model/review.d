// File automatically generated from OpenAPI spec.
module stripe.model.review;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.charge : Charge;
import stripe.model.payment_intent : PaymentIntent;
import stripe.model.radar_review_resource_location : RadarReviewResourceLocation;
import stripe.model.radar_review_resource_session : RadarReviewResourceSession;

/**
 * Reviews can be used to supplement automated fraud detection with human expertise.
 * Learn more about [Radar](/radar) and reviewing payments
 * [here](https://stripe.com/docs/radar/reviews).
 */
class Review {
  /**
   * The reason the review was closed, or null if it has not yet been closed. One of `approved`,
   * `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.
   */
  @optional
  string closed_reason;

  /**
   * The reason the review was opened. One of `rule` or `manual`.
   */
  @optional
  string opened_reason;

  /**
   * The PaymentIntent ID associated with this review, if one exists.
   */
  @optional
  Json payment_intent;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The IP address where the payment originated.
   */
  @optional
  string ip_address;

  /**
   * The reason the review is currently open or closed. One of `rule`, `manual`, `approved`,
   * `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.
   */
  @optional
  string reason;

  /**
   * The ZIP or postal code of the card used, if applicable.
   */
  @optional
  string billing_zip;

  /**
   * Information related to the location of the payment. Note that this information is an
   * approximation and attempts to locate the nearest population center - it should not be used to
   * determine a specific address.
   */
  @optional
  RadarReviewResourceLocation ip_address_location;

  /**
   * The charge associated with this review.
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
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * If `true`, the review needs action.
   */
  @optional
  Nullable!(bool) open;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Information related to the browsing session of the user who initiated the payment.
   */
  @optional
  RadarReviewResourceSession session;

}
