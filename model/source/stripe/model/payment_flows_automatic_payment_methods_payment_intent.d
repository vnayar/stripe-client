// File automatically generated from OpenAPI spec.
module stripe.model.payment_flows_automatic_payment_methods_payment_intent;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentFlowsAutomaticPaymentMethodsPaymentIntent {
  /**
   * Automatically calculates compatible payment methods
   */
  @optional
  Nullable!(bool) enabled;

  mixin AddBuilder!(typeof(this));

}
