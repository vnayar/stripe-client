// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_interac_present;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_method_details_interac_present_receipt : PaymentMethodDetailsInteracPresentReceipt;

/**
 */
class PaymentMethodDetailsInteracPresent {
  /**
   * Two-letter ISO code representing the country of the card. You could use this attribute to get
   * a sense of the international breakdown of cards you've collected.
   */
  @optional
  string country;

  /**
   * How card details were read in this transaction.
   */
  @optional
  string read_method;

  /**
   * A collection of fields required to be displayed on receipts. Only required for EMV
   * transactions.
   */
  @optional
  PaymentMethodDetailsInteracPresentReceipt receipt;

  /**
   * The cardholder name as read from the card, in [ISO
   * 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric
   * characters, special characters and first/last name separator (`/`). In some cases, the
   * cardholder name may not be available depending on how the issuer has configured the card.
   * Cardholder name is typically not available on swipe or contactless payments, such as those
   * made with Apple Pay and Google Pay.
   */
  @optional
  string cardholder_name;

  /**
   * Two-digit number representing the card's expiration month.
   */
  @optional
  Nullable!(int) exp_month;

  /**
   * ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached
   * to a Customer for future transactions. Only present if it was possible to generate a card
   * PaymentMethod.
   */
  @optional
  string generated_card;

  /**
   * Four-digit number representing the card's expiration year.
   */
  @optional
  Nullable!(int) exp_year;

  /**
   * Card brand. Can be `interac`, `mastercard` or `visa`.
   */
  @optional
  string brand;

  /**
   * Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
   */
  @optional
  string funding;

  /**
   * The last four digits of the card.
   */
  @optional
  string last4;

  /**
   * Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`,
   * `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
   */
  @optional
  string network;

  /**
   * EMV tag 5F2D. Preferred languages specified by the integrated circuit chip.
   */
  @optional
  string[] preferred_locales;

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
   * Authorization response cryptogram.
   */
  @optional
  string emv_auth_data;

}
