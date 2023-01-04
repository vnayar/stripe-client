// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.networks : Networks;
import stripe.model.payment_method_card_checks : PaymentMethodCardChecks;
import stripe.model.payment_method_card_generated_card : PaymentMethodCardGeneratedCard;
import stripe.model.payment_method_card_wallet : PaymentMethodCardWallet;
import stripe.model.three_d_secure_usage : ThreeDSecureUsage;

/**
 */
class PaymentMethodCard {
  /**
   * Two-letter ISO code representing the country of the card. You could use this attribute to get
   * a sense of the international breakdown of cards you've collected.
   */
  @optional
  string country;

  /**
   * Checks on Card address and CVC if provided.
   */
  @optional
  PaymentMethodCardChecks checks;

  /**
   * Two-digit number representing the card's expiration month.
   */
  @optional
  Nullable!(int) exp_month;

  /**
   * Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
   */
  @optional
  string funding;

  /**
   * Four-digit number representing the card's expiration year.
   */
  @optional
  Nullable!(int) exp_year;

  /**
   * Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or
   * `unknown`.
   */
  @optional
  string brand;

  /**
   * The last four digits of the card.
   */
  @optional
  string last4;

  /**
   * If this Card is part of a card wallet, this contains the details of the card wallet.
   */
  @optional
  PaymentMethodCardWallet wallet;

  /**
   * Contains information about card networks that can be used to process the payment.
   */
  @optional
  Networks networks;

  /**
   * Contains details on how this Card maybe be used for 3D Secure authentication.
   */
  @optional
  ThreeDSecureUsage three_d_secure_usage;

  /**
   * Details of the original PaymentMethod that created this object.
   */
  @optional
  PaymentMethodCardGeneratedCard generated_from;

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

}
