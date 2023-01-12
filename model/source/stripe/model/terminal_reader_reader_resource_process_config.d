// File automatically generated from OpenAPI spec.
module stripe.model.terminal_reader_reader_resource_process_config;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.terminal_reader_reader_resource_tipping_config : TerminalReaderReaderResourceTippingConfig;

/**
 * Represents a per-transaction override of a reader configuration
 */
class TerminalReaderReaderResourceProcessConfig {
  @optional
  TerminalReaderReaderResourceTippingConfig tipping;

  /**
   * Override showing a tipping selection screen on this transaction.
   */
  @optional
  Nullable!(bool) skip_tipping;

  mixin AddBuilder!(typeof(this));

}
