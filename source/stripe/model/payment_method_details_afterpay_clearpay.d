// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_afterpay_clearpay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsAfterpayClearpay {
  /**
   * Order identifier shown to the merchant in Afterpay’s online portal.
   */
  @optional
  string reference;

  mixin AddBuilder!(typeof(this));

}
