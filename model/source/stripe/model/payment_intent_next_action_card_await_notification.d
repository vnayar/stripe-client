// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_card_await_notification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionCardAwaitNotification {
  /**
   * For payments greater than INR 15000, the customer must provide explicit approval of the
   * payment with their bank. For payments of lower amount, no customer action is required.
   */
  @optional
  Nullable!(bool) customer_approval_required;

  /**
   * The time that payment will be attempted. If customer approval is required, they need to
   * provide approval before this time.
   */
  @optional
  Nullable!(long) charge_attempt_at;

  mixin AddBuilder!(typeof(this));

}
