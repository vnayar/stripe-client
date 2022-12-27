// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_tipping_config;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Represents a per-transaction tipping configuration
 */
class TerminalReaderReaderResourceTippingConfig {
  /**
   * Amount used to calculate tip suggestions on tipping selection screen for this transaction.
   * Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00
   * or 100 to represent ¥100, a zero-decimal currency).
   */
  @optional
  Nullable!(int) amount_eligible;

}
