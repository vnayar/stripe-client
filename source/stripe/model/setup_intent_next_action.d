// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_next_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.setup_intent_next_action_redirect_to_url : SetupIntentNextActionRedirectToUrl;
import stripe.model.setup_intent_next_action_verify_with_microdeposits : SetupIntentNextActionVerifyWithMicrodeposits;

/**
 */
class SetupIntentNextAction {
  /**
   * Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`,
   * `alipay_handle_redirect`, `oxxo_display_details`, or `verify_with_microdeposits`.
   */
  @optional
  string type;

  @optional
  SetupIntentNextActionRedirectToUrl redirect_to_url;

  /**
   * When confirming a SetupIntent with Stripe.js, Stripe.js depends on the contents of this
   * dictionary to invoke authentication flows. The shape of the contents is subject to change and
   * is only intended to be used by Stripe.js.
   */
  @optional
  Json use_stripe_sdk;

  @optional
  SetupIntentNextActionVerifyWithMicrodeposits verify_with_microdeposits;

}
