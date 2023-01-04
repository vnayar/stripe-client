// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_card_wallet_masterpass;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class PaymentMethodDetailsCardWalletMasterpass {
  /**
   * Owner's verified email. Values are verified or provided by the wallet directly (if supported)
   * at the time of authorization or settlement. They cannot be set or mutated.
   */
  @optional
  string email;

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
  string name;

}
