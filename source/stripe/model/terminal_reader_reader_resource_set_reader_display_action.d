// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_set_reader_display_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.terminal_reader_reader_resource_cart : TerminalReaderReaderResourceCart;

/**
 * Represents a reader action to set the reader display
 */
class TerminalReaderReaderResourceSetReaderDisplayAction {
  /**
   * Type of information to be displayed by the reader.
   */
  @optional
  string type;

  /**
   * Cart object to be displayed by the reader.
   */
  @optional
  TerminalReaderReaderResourceCart cart;

  mixin AddBuilder!(typeof(this));

}
