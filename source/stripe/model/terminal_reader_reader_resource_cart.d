// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_cart;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.terminal_reader_reader_resource_line_item : TerminalReaderReaderResourceLineItem;

/**
 * Represents a cart to be displayed on the reader
 */
class TerminalReaderReaderResourceCart {
  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Tax amount for the entire cart. A positive integer in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) tax;

  /**
   * Total amount for the entire cart, including tax. A positive integer in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) total;

  /**
   * List of line items in the cart.
   */
  @optional
  TerminalReaderReaderResourceLineItem[] line_items;

}
