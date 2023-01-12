// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_reader_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.terminal_reader_reader_resource_process_payment_intent_action : TerminalReaderReaderResourceProcessPaymentIntentAction;
import stripe.model.terminal_reader_reader_resource_process_setup_intent_action : TerminalReaderReaderResourceProcessSetupIntentAction;
import stripe.model.terminal_reader_reader_resource_set_reader_display_action : TerminalReaderReaderResourceSetReaderDisplayAction;

/**
 * Represents an action performed by the reader
 */
class TerminalReaderReaderResourceReaderAction {
  /**
   * Detailed failure message, only set if status is `failed`.
   */
  @optional
  string failure_message;

  @optional
  TerminalReaderReaderResourceProcessSetupIntentAction process_setup_intent;

  @optional
  TerminalReaderReaderResourceProcessPaymentIntentAction process_payment_intent;

  /**
   * Type of action performed by the reader.
   */
  @optional
  string type;

  @optional
  TerminalReaderReaderResourceSetReaderDisplayAction set_reader_display;

  /**
   * Failure code, only set if status is `failed`.
   */
  @optional
  string failure_code;

  /**
   * Status of the action performed by the reader.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}
