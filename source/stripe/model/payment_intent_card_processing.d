// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_card_processing;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_processing_customer_notification : PaymentIntentProcessingCustomerNotification;

/**
 */
class PaymentIntentCardProcessing {
  @optional
  PaymentIntentProcessingCustomerNotification customer_notification;

}
