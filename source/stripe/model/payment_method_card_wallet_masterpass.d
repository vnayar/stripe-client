// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_card_wallet_masterpass;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class PaymentMethodCardWalletMasterpass {
  /**
   * Owner's verified email. Values are verified or provided by the wallet directly (if supported)
   * at the time of authorization or settlement. They cannot be set or mutated.
   */
  @optional
  Nullable!(string) email;

  /**
   * Owner's verified shipping address. Values are verified or provided by the wallet directly (if
   * supported) at the time of authorization or settlement. They cannot be set or mutated.
   */
  @optional
  Address shipping_address;

  /**
   * Owner's verified billing address. Values are verified or provided by the wallet directly (if
   * supported) at the time of authorization or settlement. They cannot be set or mutated.
   */
  @optional
  Address billing_address;

  /**
   * Owner's verified full name. Values are verified or provided by the wallet directly (if
   * supported) at the time of authorization or settlement. They cannot be set or mutated.
   */
  @optional
  Nullable!(string) name;

}