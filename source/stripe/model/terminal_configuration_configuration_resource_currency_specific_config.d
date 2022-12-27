// File automatically generated from OpenAPI spec.
module stripe.model.terminal_configuration_configuration_resource_currency_specific_config;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TerminalConfigurationConfigurationResourceCurrencySpecificConfig {
  /**
   * Fixed amounts displayed when collecting a tip
   */
  @optional
  Nullable!(int)[] fixed_amounts;

  /**
   * Percentages displayed when collecting a tip
   */
  @optional
  Nullable!(int)[] percentages;

  /**
   * Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
   */
  @optional
  Nullable!(int) smart_tip_threshold;

}
