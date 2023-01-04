// File automatically generated from OpenAPI spec.
module stripe.model.token;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;

/**
 * Tokenization is the process Stripe uses to collect sensitive card or bank
 * account details, or personally identifiable information (PII), directly from
 * your customers in a secure manner. A token representing this information is
 * returned to your server to use. You should use our
 * [recommended payments integrations](https://stripe.com/docs/payments) to perform this process
 * client-side. This ensures that no sensitive card data touches your server,
 * and allows your integration to operate in a PCI-compliant way.
 * If you cannot use client-side tokenization, you can also create tokens using
 * the API with either your publishable or secret API key. Keep in mind that if
 * your integration uses this method, you are responsible for any PCI compliance
 * that may be required, and you must keep your secret API key safe. Unlike with
 * client-side tokenization, your customer's information is not sent directly to
 * Stripe, so we cannot determine how it is handled or stored.
 * Tokens cannot be stored or used more than once. To store card or bank account
 * information for later use, you can create [Customer](https://stripe.com/docs/api#customers)
 * objects or [Custom accounts](https://stripe.com/docs/api#external_accounts). Note that
 * [Radar](https://stripe.com/docs/radar), our integrated solution for automatic fraud protection,
 * performs best with integrations that use client-side tokenization.
 * Related guide: [Accept a
 * payment](https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token)
 */
class Token {
  @optional
  BankAccount bank_account;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  @optional
  Card card;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Whether this token has already been used (tokens can be used only once).
   */
  @optional
  Nullable!(bool) used;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Type of the token: `account`, `bank_account`, `card`, or `pii`.
   */
  @optional
  string type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * IP address of the client that generated the token.
   */
  @optional
  string client_ip;

}
