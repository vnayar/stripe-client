// File automatically generated from OpenAPI spec.
module stripe.model.payment_flows_private_payment_methods_klarna_dob;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentFlowsPrivatePaymentMethodsKlarnaDob {
  /**
   * The four-digit year of birth.
   */
  @optional
  Nullable!(int) year;

  /**
   * The month of birth, between 1 and 12.
   */
  @optional
  Nullable!(int) month;

  /**
   * The day of birth, between 1 and 31.
   */
  @optional
  Nullable!(int) day;

}
