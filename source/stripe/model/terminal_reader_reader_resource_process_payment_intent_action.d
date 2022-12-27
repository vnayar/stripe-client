// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_process_payment_intent_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent : PaymentIntent;
import stripe.model.terminal_reader_reader_resource_process_config : TerminalReaderReaderResourceProcessConfig;

/**
 * Represents a reader action to process a payment intent
 */
class TerminalReaderReaderResourceProcessPaymentIntentAction {
  @optional
  TerminalReaderReaderResourceProcessConfig process_config;

  /**
   * Most recent PaymentIntent processed by the reader.
   */
  @optional
  Json payment_intent;

}
