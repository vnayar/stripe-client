// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_payment_intent_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourcePaymentIntentData {
  /**
   * Indicates that you intend to make future payments with the payment method collected during
   * checkout.
   */
  @optional
  string setup_future_usage;

  /**
   * Indicates when the funds will be captured from the customer's account.
   */
  @optional
  string capture_method;

  mixin AddBuilder!(typeof(this));

}
