// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_promptpay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsPromptpay {
  /**
   * Bill reference generated by PromptPay
   */
  @optional
  string reference;

  mixin AddBuilder!(typeof(this));

}
