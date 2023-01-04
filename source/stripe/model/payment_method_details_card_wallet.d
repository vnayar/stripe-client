// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_card_wallet;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_method_details_card_wallet_amex_express_checkout : PaymentMethodDetailsCardWalletAmexExpressCheckout;
import stripe.model.payment_method_details_card_wallet_apple_pay : PaymentMethodDetailsCardWalletApplePay;
import stripe.model.payment_method_details_card_wallet_google_pay : PaymentMethodDetailsCardWalletGooglePay;
import stripe.model.payment_method_details_card_wallet_masterpass : PaymentMethodDetailsCardWalletMasterpass;
import stripe.model.payment_method_details_card_wallet_samsung_pay : PaymentMethodDetailsCardWalletSamsungPay;
import stripe.model.payment_method_details_card_wallet_visa_checkout : PaymentMethodDetailsCardWalletVisaCheckout;

/**
 */
class PaymentMethodDetailsCardWallet {
  @optional
  PaymentMethodDetailsCardWalletAmexExpressCheckout amex_express_checkout;

  @optional
  PaymentMethodDetailsCardWalletApplePay apple_pay;

  /**
   * (For tokenized numbers only.) The last four digits of the device account number.
   */
  @optional
  string dynamic_last4;

  @optional
  PaymentMethodDetailsCardWalletSamsungPay samsung_pay;

  @optional
  PaymentMethodDetailsCardWalletVisaCheckout visa_checkout;

  @optional
  PaymentMethodDetailsCardWalletGooglePay google_pay;

  @optional
  PaymentMethodDetailsCardWalletMasterpass masterpass;

  /**
   * The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`,
   * `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet
   * subhash with a name matching this value. It contains additional information specific to the
   * card wallet type.
   */
  @optional
  string type;

}
