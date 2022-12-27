// File automatically generated from OpenAPI spec.
module stripe.model.refund_next_action_display_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.email_sent : EmailSent;

/**
 */
class RefundNextActionDisplayDetails {
  /**
   * The expiry timestamp.
   */
  @optional
  Nullable!(long) expires_at;

  @optional
  EmailSent email_sent;

}
