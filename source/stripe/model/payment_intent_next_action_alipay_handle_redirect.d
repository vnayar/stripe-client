// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_alipay_handle_redirect;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionAlipayHandleRedirect {
  /**
   * If the customer does not exit their browser while authenticating, they will be redirected to
   * this specified URL after completion.
   */
  @optional
  Nullable!(string) return_url;

  /**
   * The native data to be used with Alipay SDK you must redirect your customer to in order to
   * authenticate the payment in an Android App.
   */
  @optional
  Nullable!(string) native_data;

  /**
   * The native URL you must redirect your customer to in order to authenticate the payment in an
   * iOS App.
   */
  @optional
  Nullable!(string) native_url;

  /**
   * The URL you must redirect your customer to in order to authenticate the payment.
   */
  @optional
  Nullable!(string) url;

}
