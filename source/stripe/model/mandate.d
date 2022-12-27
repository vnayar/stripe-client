// File automatically generated from OpenAPI spec.
module stripe.model.mandate;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer_acceptance : CustomerAcceptance;
import stripe.model.mandate_multi_use : MandateMultiUse;
import stripe.model.mandate_payment_method_details : MandatePaymentMethodDetails;
import stripe.model.mandate_single_use : MandateSingleUse;
import stripe.model.payment_method : PaymentMethod;

/**
 * A Mandate is a record of the permission a customer has given you to debit their payment method.
 */
class Mandate {
  @optional
  CustomerAcceptance customer_acceptance;

  @optional
  MandateMultiUse multi_use;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  @optional
  MandatePaymentMethodDetails payment_method_details;

  @optional
  MandateSingleUse single_use;

  /**
   * ID of the payment method associated with this mandate.
   */
  @optional
  Json payment_method;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The type of the mandate.
   */
  @optional
  Nullable!(string) type;

  /**
   * The status of the mandate, which indicates whether it can be used to initiate a payment.
   */
  @optional
  Nullable!(string) status;

}
