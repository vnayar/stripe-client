// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_klarna;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_flows_private_payment_methods_klarna_dob : PaymentFlowsPrivatePaymentMethodsKlarnaDob;

/**
 */
class PaymentMethodKlarna {
  /**
   * The customer's date of birth, if provided.
   */
  @optional
  PaymentFlowsPrivatePaymentMethodsKlarnaDob dob;

  mixin AddBuilder!(typeof(this));

}
