// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_processing_customer_notification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentProcessingCustomerNotification {
  /**
   * If customer approval is required, they need to provide approval before this time.
   */
  @optional
  Nullable!(long) completes_at;

  /**
   * Whether customer approval has been requested for this payment. For payments greater than INR
   * 15000 or mandate amount, the customer must provide explicit approval of the payment with
   * their bank.
   */
  @optional
  Nullable!(bool) approval_requested;

}
