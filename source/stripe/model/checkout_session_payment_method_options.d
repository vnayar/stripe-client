// File automatically generated from OpenAPI spec.
module stripe.model.checkout_session_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.checkout_acss_debit_payment_method_options : CheckoutAcssDebitPaymentMethodOptions;
import stripe.model.checkout_affirm_payment_method_options : CheckoutAffirmPaymentMethodOptions;
import stripe.model.checkout_afterpay_clearpay_payment_method_options : CheckoutAfterpayClearpayPaymentMethodOptions;
import stripe.model.checkout_alipay_payment_method_options : CheckoutAlipayPaymentMethodOptions;
import stripe.model.checkout_au_becs_debit_payment_method_options : CheckoutAuBecsDebitPaymentMethodOptions;
import stripe.model.checkout_bacs_debit_payment_method_options : CheckoutBacsDebitPaymentMethodOptions;
import stripe.model.checkout_bancontact_payment_method_options : CheckoutBancontactPaymentMethodOptions;
import stripe.model.checkout_boleto_payment_method_options : CheckoutBoletoPaymentMethodOptions;
import stripe.model.checkout_card_payment_method_options : CheckoutCardPaymentMethodOptions;
import stripe.model.checkout_customer_balance_payment_method_options : CheckoutCustomerBalancePaymentMethodOptions;
import stripe.model.checkout_eps_payment_method_options : CheckoutEpsPaymentMethodOptions;
import stripe.model.checkout_fpx_payment_method_options : CheckoutFpxPaymentMethodOptions;
import stripe.model.checkout_giropay_payment_method_options : CheckoutGiropayPaymentMethodOptions;
import stripe.model.checkout_grab_pay_payment_method_options : CheckoutGrabPayPaymentMethodOptions;
import stripe.model.checkout_ideal_payment_method_options : CheckoutIdealPaymentMethodOptions;
import stripe.model.checkout_klarna_payment_method_options : CheckoutKlarnaPaymentMethodOptions;
import stripe.model.checkout_konbini_payment_method_options : CheckoutKonbiniPaymentMethodOptions;
import stripe.model.checkout_oxxo_payment_method_options : CheckoutOxxoPaymentMethodOptions;
import stripe.model.checkout_p24_payment_method_options : CheckoutP24PaymentMethodOptions;
import stripe.model.checkout_paynow_payment_method_options : CheckoutPaynowPaymentMethodOptions;
import stripe.model.checkout_pix_payment_method_options : CheckoutPixPaymentMethodOptions;
import stripe.model.checkout_sepa_debit_payment_method_options : CheckoutSepaDebitPaymentMethodOptions;
import stripe.model.checkout_sofort_payment_method_options : CheckoutSofortPaymentMethodOptions;
import stripe.model.checkout_us_bank_account_payment_method_options : CheckoutUsBankAccountPaymentMethodOptions;

/**
 */
class CheckoutSessionPaymentMethodOptions {
  @optional
  CheckoutBancontactPaymentMethodOptions bancontact;

  @optional
  CheckoutAuBecsDebitPaymentMethodOptions au_becs_debit;

  @optional
  CheckoutCustomerBalancePaymentMethodOptions customer_balance;

  @optional
  CheckoutKlarnaPaymentMethodOptions klarna;

  @optional
  CheckoutAlipayPaymentMethodOptions alipay;

  @optional
  CheckoutEpsPaymentMethodOptions eps;

  @optional
  CheckoutGiropayPaymentMethodOptions giropay;

  @optional
  CheckoutIdealPaymentMethodOptions ideal;

  @optional
  CheckoutUsBankAccountPaymentMethodOptions us_bank_account;

  @optional
  CheckoutBacsDebitPaymentMethodOptions bacs_debit;

  @optional
  CheckoutBoletoPaymentMethodOptions boleto;

  @optional
  CheckoutAfterpayClearpayPaymentMethodOptions afterpay_clearpay;

  @optional
  CheckoutCardPaymentMethodOptions card;

  @optional
  CheckoutAffirmPaymentMethodOptions affirm;

  @optional
  CheckoutFpxPaymentMethodOptions fpx;

  @optional
  CheckoutKonbiniPaymentMethodOptions konbini;

  @optional
  CheckoutSofortPaymentMethodOptions sofort;

  @optional
  CheckoutOxxoPaymentMethodOptions oxxo;

  @optional
  CheckoutPaynowPaymentMethodOptions paynow;

  @optional
  CheckoutGrabPayPaymentMethodOptions grabpay;

  @optional
  CheckoutAcssDebitPaymentMethodOptions acss_debit;

  @optional
  CheckoutSepaDebitPaymentMethodOptions sepa_debit;

  @optional
  CheckoutP24PaymentMethodOptions p24;

  @optional
  CheckoutPixPaymentMethodOptions pix;

  mixin AddBuilder!(typeof(this));

}
