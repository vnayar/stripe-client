// File automatically generated from OpenAPI spec.
module stripe.model.issuing.transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.issuing.authorization : IssuingAuthorization;
import stripe.model.issuing.card : IssuingCard;
import stripe.model.issuing.cardholder : IssuingCardholder;
import stripe.model.issuing.dispute : IssuingDispute;
import stripe.model.issuing_authorization_merchant_data : IssuingAuthorizationMerchantData;
import stripe.model.issuing_transaction_amount_details : IssuingTransactionAmountDetails;
import stripe.model.issuing_transaction_purchase_details : IssuingTransactionPurchaseDetails;
import stripe.model.issuing_transaction_treasury : IssuingTransactionTreasury;

/**
 * Any use of an [issued card](https://stripe.com/docs/issuing) that results in funds entering or
 * leaving
 * your Stripe account, such as a completed purchase or refund, is represented by an Issuing
 * `Transaction` object.
 * Related guide: [Issued Card
 * Transactions](https://stripe.com/docs/issuing/purchases/transactions).
 */
class IssuingTransaction {
  /**
   * Additional purchase information that is optionally provided by the merchant.
   */
  @optional
  IssuingTransactionPurchaseDetails purchase_details;

  /**
   * The transaction amount, which will be reflected in your balance. This amount is in your
   * currency and in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) amount;

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
   * ID of the [balance transaction](https://stripe.com/docs/api/balance_transactions) associated
   * with this transaction.
   */
  @optional
  Json balance_transaction;

  /**
   * The card used to make this transaction.
   */
  @optional
  Json card;

  /**
   * The cardholder to whom this transaction belongs.
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
   * The amount that the merchant will receive, denominated in `merchant_currency` and in the
   * [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). It will be
   * different from `amount` if the merchant is taking payment in a different currency.
   */
  @optional
  Nullable!(int) merchant_amount;

  /**
   * The currency with which the merchant is taking payment.
   */
  @optional
  string merchant_currency;

  /**
   * The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or
   * `samsung_pay`.
   */
  @optional
  string wallet;

  /**
   * Detailed breakdown of amount components. These amounts are denominated in `currency` and in
   * the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  IssuingTransactionAmountDetails amount_details;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * If you've disputed the transaction, the ID of the dispute.
   */
  @optional
  Json dispute;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * [Treasury](https://stripe.com/docs/api/treasury) details related to this transaction if it
   * was created on a [FinancialAccount](/docs/api/treasury/financial_accounts
   */
  @optional
  IssuingTransactionTreasury treasury;

  @optional
  IssuingAuthorizationMerchantData merchant_data;

  /**
   * The nature of the transaction.
   */
  @optional
  string type;

  /**
   * The `Authorization` object that led to this transaction.
   */
  @optional
  Json authorization;

  mixin AddBuilder!(typeof(this));

}
