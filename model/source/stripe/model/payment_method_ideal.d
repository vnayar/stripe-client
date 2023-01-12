// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_ideal;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodIdeal {
  /**
   * The customer's bank, if provided. Can be one of `abn_amro`, `asn_bank`, `bunq`,
   * `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`,
   * `triodos_bank`, or `van_lanschot`.
   */
  @optional
  string bank;

  /**
   * The Bank Identifier Code of the customer's bank, if the bank was provided.
   */
  @optional
  string bic;

  mixin AddBuilder!(typeof(this));

}
