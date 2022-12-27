// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_line_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Represents a line item to be displayed on the reader
 */
class TerminalReaderReaderResourceLineItem {
  /**
   * Description of the line item.
   */
  @optional
  Nullable!(string) description;

  /**
   * The amount of the line item. A positive integer in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) amount;

  /**
   * The quantity of the line item.
   */
  @optional
  Nullable!(int) quantity;

}
