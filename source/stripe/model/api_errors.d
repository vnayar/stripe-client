// File automatically generated from OpenAPI spec.
module stripe.model.api_errors;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;
import stripe.model.payment_intent : PaymentIntent;
import stripe.model.payment_method : PaymentMethod;
import stripe.model.setup_intent : SetupIntent;
import stripe.model.source : Source;

/**
 */
class ApiErrors {
  /**
   * For card errors resulting from a card issuer decline, a short string indicating the [card
   * issuer's reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they
   * provide one.
   */
  @optional
  string decline_code;

  @optional
  PaymentIntent payment_intent;

  /**
   * A URL to more information about the [error code](https://stripe.com/docs/error-codes)
   * reported.
   */
  @optional
  string doc_url;

  /**
   * A human-readable message providing more details about the error. For card errors, these
   * messages can be shown to your users.
   */
  @optional
  string message;

  /**
   * For some errors that could be handled programmatically, a short string indicating the [error
   * code](https://stripe.com/docs/error-codes) reported.
   */
  @optional
  string code;

  /**
   * The source object for errors returned on a request involving a source.
   */
  @optional
  Json source;

  /**
   * For card errors, the ID of the failed charge.
   */
  @optional
  string charge;

  /**
   * If the error is specific to the type of payment method, the payment method type that had a
   * problem. This field is only populated for invoice-related errors.
   */
  @optional
  string payment_method_type;

  @optional
  PaymentMethod payment_method;

  @optional
  SetupIntent setup_intent;

  /**
   * The type of error returned. One of `api_error`, `card_error`, `idempotency_error`, or
   * `invalid_request_error`
   */
  @optional
  string type;

  /**
   * If the error is parameter-specific, the parameter related to the error. For example, you can
   * use this to display a message near the correct form field.
   */
  @optional
  string param;

  /**
   * A URL to the request log entry in your dashboard.
   */
  @optional
  string request_log_url;

}
