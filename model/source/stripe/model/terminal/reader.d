// File automatically generated from OpenAPI spec.
module stripe.model.terminal.reader;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.terminal.location : TerminalLocation;
import stripe.model.terminal_reader_reader_resource_reader_action : TerminalReaderReaderResourceReaderAction;

/**
 * A Reader represents a physical device for accepting payment details.
 * Related guide: [Connecting to a
 * Reader](https://stripe.com/docs/terminal/payments/connect-reader).
 */
class TerminalReader {
  /**
   * The location identifier of the reader.
   */
  @optional
  Json location;

  /**
   * Type of reader, one of `bbpos_wisepad3`, `stripe_m2`, `bbpos_chipper2x`, `bbpos_wisepos_e`,
   * `verifone_P400`, or `simulated_wisepos_e`.
   */
  @optional
  string device_type;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The local IP address of the reader.
   */
  @optional
  string ip_address;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Serial number of the reader.
   */
  @optional
  string serial_number;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The most recent action performed by the reader.
   */
  @optional
  TerminalReaderReaderResourceReaderAction action;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Custom label given to the reader for easier identification.
   */
  @optional
  string label;

  /**
   * The current software version of the reader.
   */
  @optional
  string device_sw_version;

  /**
   * The networking status of the reader.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}
