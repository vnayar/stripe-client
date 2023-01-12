// File automatically generated from OpenAPI spec.
module stripe.model.card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;

/**
 * You can store multiple cards on a customer in order to charge the customer
 * later. You can also store multiple debit cards on a recipient in order to
 * transfer to those cards later.
 * Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
 */
class Card {
  /**
   * State/County/Province/Region.
   */
  @optional
  string address_state;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * City/District/Suburb/Town/Village.
   */
  @optional
  string address_city;

  /**
   * Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`,
   * `UnionPay`, `Visa`, or `Unknown`.
   */
  @optional
  string brand;

  /**
   * Whether this card is the default external account for its currency.
   */
  @optional
  Nullable!(bool) default_for_currency;

  /**
   * Cardholder name.
   */
  @optional
  string name;

  /**
   * Address line 2 (Apartment/Suite/Unit/Building).
   */
  @optional
  string address_line2;

  /**
   * The customer that this card belongs to. This attribute will not be in the card object if the
   * card belongs to an account or recipient instead.
   */
  @optional
  Json customer;

  /**
   * (For tokenized numbers only.) The last four digits of the device account number.
   */
  @optional
  string dynamic_last4;

  /**
   * Three-letter [ISO code for currency](https://stripe.com/docs/payouts). Only applicable on
   * accounts (not customers or recipients). The card can be used as a transfer destination for
   * funds in this currency.
   */
  @optional
  string currency;

  /**
   * Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
   */
  @optional
  string funding;

  /**
   * Address line 1 (Street address/PO Box/Company name).
   */
  @optional
  string address_line1;

  /**
   * The last four digits of the card.
   */
  @optional
  string last4;

  /**
   * Two-letter ISO code representing the country of the card. You could use this attribute to get
   * a sense of the international breakdown of cards you've collected.
   */
  @optional
  string country;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Two-digit number representing the card's expiration month.
   */
  @optional
  Nullable!(int) exp_month;

  /**
   * If the card number is tokenized, this is the method that was used. Can be `android_pay`
   * (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null.
   */
  @optional
  string tokenization_method;

  /**
   * A set of available payout methods for this card. Only values from this set should be passed
   * as the `method` when creating a payout.
   */
  @optional
  string[] available_payout_methods;

  /**
   * If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or
   * `unchecked`.
   */
  @optional
  string address_zip_check;

  /**
   * Uniquely identifies this particular card number. You can use this attribute to check whether
   * two customers who’ve signed up with you are using the same card number, for example. For
   * payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number
   * might be provided instead of the underlying card number.
   * *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two
   * fingerprints for the same card --- one for India and one for the rest of the world.*
   */
  @optional
  string fingerprint;

  /**
   * For external accounts, possible values are `new` and `errored`. If a transfer fails, the
   * status is set to `errored` and transfers are stopped until account details are updated.
   */
  @optional
  string status;

  /**
   * ZIP or postal code.
   */
  @optional
  string address_zip;

  /**
   * Billing address country, if provided when creating card.
   */
  @optional
  string address_country;

  /**
   * Four-digit number representing the card's expiration year.
   */
  @optional
  Nullable!(int) exp_year;

  /**
   * If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A
   * result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are
   * typically performed when attaching a card to a Customer object, or when creating a charge.
   * For more details, see [Check if a card is valid without a
   * charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge).
   */
  @optional
  string cvc_check;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or
   * `unchecked`.
   */
  @optional
  string address_line1_check;

  /**
   * The account this card belongs to. This attribute will not be in the card object if the card
   * belongs to a customer or recipient instead.
   */
  @optional
  Json account;

  mixin AddBuilder!(typeof(this));

}
