// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_request;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_authorization_amount_details : IssuingAuthorizationAmountDetails;

/**
 */
class IssuingAuthorizationRequest {
  /**
   * The `pending_request.amount` at the time of the request, presented in your card's currency
   * and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). Stripe
   * held this amount from your account to fund the authorization if the request was approved.
   */
  @optional
  Nullable!(int) amount;

  /**
   * When an authorization is approved or declined by you or by Stripe, this field provides
   * additional detail on the reason for the outcome.
   */
  @optional
  Nullable!(string) reason;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * If approve/decline decision is directly responsed to the webhook with json payload and if the
   * response is invalid (e.g., parsing errors), we surface the detailed message via this field.
   */
  @optional
  Nullable!(string) reason_message;

  /**
   * Whether this request was approved.
   */
  @optional
  Nullable!(bool) approved;

  /**
   * The `pending_request.merchant_amount` at the time of the request, presented in the
   * `merchant_currency` and in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) merchant_amount;

  /**
   * The currency that was collected by the merchant and presented to the cardholder for the
   * authorization. Three-letter [ISO currency
   * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported
   * currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) merchant_currency;

  /**
   * Detailed breakdown of amount components. These amounts are denominated in `currency` and in
   * the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  IssuingAuthorizationAmountDetails amount_details;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

}
