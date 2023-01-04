// File automatically generated from OpenAPI spec.
module stripe.model.issuing_card_wallets;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_card_apple_pay : IssuingCardApplePay;
import stripe.model.issuing_card_google_pay : IssuingCardGooglePay;

/**
 */
class IssuingCardWallets {
  @optional
  IssuingCardApplePay apple_pay;

  /**
   * Unique identifier for a card used with digital wallets
   */
  @optional
  string primary_account_identifier;

  @optional
  IssuingCardGooglePay google_pay;

}
