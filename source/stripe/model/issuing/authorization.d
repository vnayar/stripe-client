// File automatically generated from OpenAPI spec.
module stripe.model.issuing.authorization;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.issuing.card : IssuingCard;
import stripe.model.issuing.cardholder : IssuingCardholder;
import stripe.model.issuing.transaction : IssuingTransaction;
import stripe.model.issuing_authorization_amount_details : IssuingAuthorizationAmountDetails;
import stripe.model.issuing_authorization_merchant_data : IssuingAuthorizationMerchantData;
import stripe.model.issuing_authorization_network_data : IssuingAuthorizationNetworkData;
import stripe.model.issuing_authorization_pending_request : IssuingAuthorizationPendingRequest;
import stripe.model.issuing_authorization_request : IssuingAuthorizationRequest;
import stripe.model.issuing_authorization_treasury : IssuingAuthorizationTreasury;
import stripe.model.issuing_authorization_verification_data : IssuingAuthorizationVerificationData;

/**
 * When an [issued card](https://stripe.com/docs/issuing) is used to make a purchase, an Issuing
 * `Authorization`
 * object is created. [Authorizations](https://stripe.com/docs/issuing/purchases/authorizations)
 * must be approved for the
 * purchase to be completed successfully.
 * Related guide: [Issued Card
 * Authorizations](https://stripe.com/docs/issuing/purchases/authorizations).
 */
class IssuingAuthorization {
  /**
   * History of every time a `pending_request` authorization was approved/declined, either by you
   * directly or by Stripe (e.g. based on your spending_controls). If the merchant changes the
   * authorization by performing an incremental authorization, you can look at this field to see
   * the previous requests for the authorization. This field can be helpful in determining why a
   * given authorization was approved/declined.
   */
  @optional
  IssuingAuthorizationRequest[] request_history;

  /**
   * The total amount that was authorized or rejected. This amount is in the card's currency and
   * in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) amount;

  @optional
  IssuingAuthorizationVerificationData verification_data;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Details about the authorization, such as identifiers, set by the card network.
   */
  @optional
  IssuingAuthorizationNetworkData network_data;

  /**
   * Whether the authorization has been approved.
   */
  @optional
  Nullable!(bool) approved;

  /**
   * List of [transactions](https://stripe.com/docs/api/issuing/transactions) associated with this
   * authorization.
   */
  @optional
  IssuingTransaction[] transactions;

  /**
   * The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or
   * `samsung_pay`. Will populate as `null` when no digital wallet was utilized.
   */
  @optional
  string wallet;

  @optional
  IssuingCard card;

  /**
   * List of balance transactions associated with this authorization.
   */
  @optional
  BalanceTransaction[] balance_transactions;

  /**
   * The cardholder to whom this authorization belongs.
   */
  @optional
  Json cardholder;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The total amount that was authorized or rejected. This amount is in the `merchant_currency`
   * and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) merchant_amount;

  /**
   * The currency that was presented to the cardholder for the authorization. Three-letter [ISO
   * currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a
   * [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string merchant_currency;

  /**
   * Detailed breakdown of amount components. These amounts are denominated in `currency` and in
   * the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  IssuingAuthorizationAmountDetails amount_details;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The pending authorization request. This field will only be non-null during an
   * `issuing_authorization.request` webhook.
   */
  @optional
  IssuingAuthorizationPendingRequest pending_request;

  /**
   * How the card details were provided.
   */
  @optional
  string authorization_method;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  IssuingAuthorizationMerchantData merchant_data;

  /**
   * The current status of the authorization in its lifecycle.
   */
  @optional
  string status;

  /**
   * [Treasury](https://stripe.com/docs/api/treasury) details related to this authorization if it
   * was created on a [FinancialAccount](https://stripe.com/docs/api/treasury/financial_accounts).
   */
  @optional
  IssuingAuthorizationTreasury treasury;

  mixin AddBuilder!(typeof(this));

}
