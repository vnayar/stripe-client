// File automatically generated from OpenAPI spec.
module stripe.model.currency_option;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.custom_unit_amount : CustomUnitAmount;
import stripe.model.price_tier : PriceTier;

/**
 */
class CurrencyOption {
  /**
   * Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to
   * `tiered`. See also the documentation for `billing_scheme`.
   */
  @optional
  PriceTier[] tiers;

  /**
   * The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal
   * places. Only set if `billing_scheme=per_unit`.
   */
  @optional
  string unit_amount_decimal;

  /**
   * When set, provides configuration for the amount to be adjusted by the customer during
   * Checkout Sessions and Payment Links.
   */
  @optional
  CustomUnitAmount custom_unit_amount;

  /**
   * The unit amount in %s to be charged, represented as a whole integer if possible. Only set if
   * `billing_scheme=per_unit`.
   */
  @optional
  Nullable!(int) unit_amount;

  /**
   * Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of
   * `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or
   * `exclusive`, it cannot be changed.
   */
  @optional
  string tax_behavior;

}
