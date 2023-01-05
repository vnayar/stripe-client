// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_options_card_present;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodOptionsCardPresent {
  /**
   * Request ability to capture this payment beyond the standard [authorization validity
   * window](https://stripe.com/docs/terminal/features/extended-authorizations#authorization-valid
   * ity)
   */
  @optional
  Nullable!(bool) request_extended_authorization;

  /**
   * Request ability to
   * [increment](https://stripe.com/docs/terminal/features/incremental-authorizations) this
   * PaymentIntent if the combination of MCC and card brand is eligible. Check
   * [incremental_authorization_supported](https://stripe.com/docs/api/charges/object#charge_objec
   * t-payment_method_details-card_present-incremental_authorization_supported) in the
   * [Confirm](https://stripe.com/docs/api/payment_intents/confirm) response to verify support.
   */
  @optional
  Nullable!(bool) request_incremental_authorization_support;

  mixin AddBuilder!(typeof(this));

}
