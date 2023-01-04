// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_card_wallet;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_method_card_wallet_amex_express_checkout : PaymentMethodCardWalletAmexExpressCheckout;
import stripe.model.payment_method_card_wallet_apple_pay : PaymentMethodCardWalletApplePay;
import stripe.model.payment_method_card_wallet_google_pay : PaymentMethodCardWalletGooglePay;
import stripe.model.payment_method_card_wallet_masterpass : PaymentMethodCardWalletMasterpass;
import stripe.model.payment_method_card_wallet_samsung_pay : PaymentMethodCardWalletSamsungPay;
import stripe.model.payment_method_card_wallet_visa_checkout : PaymentMethodCardWalletVisaCheckout;

/**
 */
class PaymentMethodCardWallet {
  @optional
  PaymentMethodCardWalletAmexExpressCheckout amex_express_checkout;

  @optional
  PaymentMethodCardWalletApplePay apple_pay;

  /**
   * (For tokenized numbers only.) The last four digits of the device account number.
   */
  @optional
  string dynamic_last4;

  @optional
  PaymentMethodCardWalletSamsungPay samsung_pay;

  @optional
  PaymentMethodCardWalletVisaCheckout visa_checkout;

  @optional
  PaymentMethodCardWalletGooglePay google_pay;

  @optional
  PaymentMethodCardWalletMasterpass masterpass;

  /**
   * The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`,
   * `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet
   * subhash with a name matching this value. It contains additional information specific to the
   * card wallet type.
   */
  @optional
  string type;

}
