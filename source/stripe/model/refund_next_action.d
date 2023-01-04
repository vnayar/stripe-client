// File automatically generated from OpenAPI spec.
module stripe.model.refund_next_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.refund_next_action_display_details : RefundNextActionDisplayDetails;

/**
 */
class RefundNextAction {
  /**
   * Type of the next action to perform.
   */
  @optional
  string type;

  /**
   * Contains the refund details.
   */
  @optional
  RefundNextActionDisplayDetails display_details;

}
