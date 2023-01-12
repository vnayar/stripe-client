// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_redirect_to_url;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionRedirectToUrl {
  /**
   * If the customer does not exit their browser while authenticating, they will be redirected to
   * this specified URL after completion.
   */
  @optional
  string return_url;

  /**
   * The URL you must redirect your customer to in order to authenticate the payment.
   */
  @optional
  string url;

  mixin AddBuilder!(typeof(this));

}
