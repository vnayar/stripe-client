// File automatically generated from OpenAPI spec.
module stripe.model.terminal_configuration_configuration_resource_tipping;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.terminal_configuration_configuration_resource_currency_specific_config : TerminalConfigurationConfigurationResourceCurrencySpecificConfig;

/**
 */
class TerminalConfigurationConfigurationResourceTipping {
  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig cad;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig dkk;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig usd;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig myr;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig sek;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig aud;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig nzd;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig czk;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig hkd;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig gbp;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig chf;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig eur;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig sgd;

  @optional
  TerminalConfigurationConfigurationResourceCurrencySpecificConfig nok;

}
