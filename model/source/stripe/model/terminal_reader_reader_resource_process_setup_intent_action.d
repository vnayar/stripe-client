// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_process_setup_intent_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.setup_intent : SetupIntent;

/**
 * Represents a reader action to process a setup intent
 */
class TerminalReaderReaderResourceProcessSetupIntentAction {
  /**
   * Most recent SetupIntent processed by the reader.
   */
  @optional
  Json setup_intent;

  /**
   * ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached
   * to a Customer for future transactions. Only present if it was possible to generate a card
   * PaymentMethod.
   */
  @optional
  string generated_card;

  mixin AddBuilder!(typeof(this));

}
