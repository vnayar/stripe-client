// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_method_details_card_checks : PaymentMethodDetailsCardChecks;
import stripe.model.payment_method_details_card_installments : PaymentMethodDetailsCardInstallments;
import stripe.model.payment_method_details_card_wallet : PaymentMethodDetailsCardWallet;
import stripe.model.three_d_secure_details : ThreeDSecureDetails;

/**
 */
class PaymentMethodDetailsCard {
  /**
   * Two-letter ISO code representing the country of the card. You could use this attribute to get
   * a sense of the international breakdown of cards you've collected.
   */
  @optional
  Nullable!(string) country;

  /**
   * Check results by Card networks on Card address and CVC at time of payment.
   */
  @optional
  PaymentMethodDetailsCardChecks checks;

  /**
   * Two-digit number representing the card's expiration month.
   */
  @optional
  Nullable!(int) exp_month;

  /**
   * Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
   */
  @optional
  Nullable!(string) funding;

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
  Nullable!(string) brand;

  /**
   * The last four digits of the card.
   */
  @optional
  Nullable!(string) last4;

  /**
   * Installment details for this payment (Mexico only).
   * For more information, see the [installments integration
   * guide](https://stripe.com/docs/payments/installments).
   */
  @optional
  PaymentMethodDetailsCardInstallments installments;

  /**
   * If this Card is part of a card wallet, this contains the details of the card wallet.
   */
  @optional
  PaymentMethodDetailsCardWallet wallet;

  /**
   * Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`,
   * `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
   */
  @optional
  Nullable!(string) network;

  /**
   * Populated if this transaction used 3D Secure authentication.
   */
  @optional
  ThreeDSecureDetails three_d_secure;

  /**
   * Uniquely identifies this particular card number. You can use this attribute to check whether
   * two customers who’ve signed up with you are using the same card number, for example. For
   * payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number
   * might be provided instead of the underlying card number.
   * *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two
   * fingerprints for the same card --- one for India and one for the rest of the world.*
   */
  @optional
  Nullable!(string) fingerprint;

  /**
   * ID of the mandate used to make this payment or created by it.
   */
  @optional
  Nullable!(string) mandate;

}
