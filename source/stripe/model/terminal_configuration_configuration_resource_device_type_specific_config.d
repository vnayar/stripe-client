// File automatically generated from OpenAPI spec.
module stripe.model.terminal_configuration_configuration_resource_device_type_specific_config;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig {
  /**
   * A File ID representing an image you would like displayed on the reader.
   */
  @optional
  Json splashscreen;

}
