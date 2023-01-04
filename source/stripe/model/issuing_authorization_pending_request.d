// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_pending_request;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_authorization_amount_details : IssuingAuthorizationAmountDetails;

/**
 */
class IssuingAuthorizationPendingRequest {
  /**
   * If set `true`, you may provide
   * [amount](https://stripe.com/docs/api/issuing/authorizations/approve#approve_issuing_authoriza
   * tion-amount) to control how much to hold for the authorization.
   */
  @optional
  Nullable!(bool) is_amount_controllable;

  /**
   * The additional amount Stripe will hold if the authorization is approved, in the card's
   * [currency](https://stripe.com/docs/api#issuing_authorization_object-pending-request-currency)
   * and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) amount;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount
   * is in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) merchant_amount;

  /**
   * The local currency the merchant is requesting to authorize.
   */
  @optional
  string merchant_currency;

  /**
   * Detailed breakdown of amount components. These amounts are denominated in `currency` and in
   * the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  IssuingAuthorizationAmountDetails amount_details;

}
