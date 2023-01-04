// File automatically generated from OpenAPI spec.
module stripe.model.terminal.configuration;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.terminal_configuration_configuration_resource_device_type_specific_config : TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig;
import stripe.model.terminal_configuration_configuration_resource_tipping : TerminalConfigurationConfigurationResourceTipping;

/**
 * A Configurations object represents how features should be configured for terminal readers.
 */
class TerminalConfiguration {
  @optional
  TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig bbpos_wisepos_e;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Whether this Configuration is the default for your account
   */
  @optional
  Nullable!(bool) is_account_default;

  @optional
  TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig verifone_p400;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  TerminalConfigurationConfigurationResourceTipping tipping;

}
