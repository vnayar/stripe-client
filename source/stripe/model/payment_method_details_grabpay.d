// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_grabpay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsGrabpay {
  /**
   * Unique transaction id generated by GrabPay
   */
  @optional
  Nullable!(string) transaction_id;

}