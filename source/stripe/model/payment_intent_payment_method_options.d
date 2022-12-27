// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_payment_method_options_acss_debit : PaymentIntentPaymentMethodOptionsAcssDebit;
import stripe.model.payment_intent_payment_method_options_au_becs_debit : PaymentIntentPaymentMethodOptionsAuBecsDebit;
import stripe.model.payment_intent_payment_method_options_blik : PaymentIntentPaymentMethodOptionsBlik;
import stripe.model.payment_intent_payment_method_options_card : PaymentIntentPaymentMethodOptionsCard;
import stripe.model.payment_intent_payment_method_options_eps : PaymentIntentPaymentMethodOptionsEps;
import stripe.model.payment_intent_payment_method_options_link : PaymentIntentPaymentMethodOptionsLink;
import stripe.model.payment_intent_payment_method_options_sepa_debit : PaymentIntentPaymentMethodOptionsSepaDebit;
import stripe.model.payment_intent_payment_method_options_us_bank_account : PaymentIntentPaymentMethodOptionsUsBankAccount;
import stripe.model.payment_intent_type_specific_payment_method_options_client : PaymentIntentTypeSpecificPaymentMethodOptionsClient;
import stripe.model.payment_method_options_affirm : PaymentMethodOptionsAffirm;
import stripe.model.payment_method_options_afterpay_clearpay : PaymentMethodOptionsAfterpayClearpay;
import stripe.model.payment_method_options_alipay : PaymentMethodOptionsAlipay;
import stripe.model.payment_method_options_bacs_debit : PaymentMethodOptionsBacsDebit;
import stripe.model.payment_method_options_bancontact : PaymentMethodOptionsBancontact;
import stripe.model.payment_method_options_boleto : PaymentMethodOptionsBoleto;
import stripe.model.payment_method_options_card_present : PaymentMethodOptionsCardPresent;
import stripe.model.payment_method_options_customer_balance : PaymentMethodOptionsCustomerBalance;
import stripe.model.payment_method_options_fpx : PaymentMethodOptionsFpx;
import stripe.model.payment_method_options_giropay : PaymentMethodOptionsGiropay;
import stripe.model.payment_method_options_grabpay : PaymentMethodOptionsGrabpay;
import stripe.model.payment_method_options_ideal : PaymentMethodOptionsIdeal;
import stripe.model.payment_method_options_interac_present : PaymentMethodOptionsInteracPresent;
import stripe.model.payment_method_options_klarna : PaymentMethodOptionsKlarna;
import stripe.model.payment_method_options_konbini : PaymentMethodOptionsKonbini;
import stripe.model.payment_method_options_oxxo : PaymentMethodOptionsOxxo;
import stripe.model.payment_method_options_p24 : PaymentMethodOptionsP24;
import stripe.model.payment_method_options_paynow : PaymentMethodOptionsPaynow;
import stripe.model.payment_method_options_pix : PaymentMethodOptionsPix;
import stripe.model.payment_method_options_promptpay : PaymentMethodOptionsPromptpay;
import stripe.model.payment_method_options_sofort : PaymentMethodOptionsSofort;
import stripe.model.payment_method_options_wechat_pay : PaymentMethodOptionsWechatPay;

/**
 */
class PaymentIntentPaymentMethodOptions {
  @optional
  Json wechat_pay;

  @optional
  Json giropay;

  @optional
  Json ideal;

  @optional
  Json bacs_debit;

  @optional
  Json card;

  @optional
  Json card_present;

  @optional
  Json acss_debit;

  @optional
  Json bancontact;

  @optional
  Json customer_balance;

  @optional
  Json alipay;

  @optional
  Json eps;

  @optional
  Json us_bank_account;

  @optional
  Json promptpay;

  @optional
  Json boleto;

  @optional
  Json sofort;

  @optional
  Json konbini;

  @optional
  Json fpx;

  @optional
  Json blik;

  @optional
  Json paynow;

  @optional
  Json p24;

  @optional
  Json pix;

  @optional
  Json link;

  @optional
  Json au_becs_debit;

  @optional
  Json klarna;

  @optional
  Json sepa_debit;

  @optional
  Json afterpay_clearpay;

  @optional
  Json affirm;

  @optional
  Json interac_present;

  @optional
  Json oxxo;

  @optional
  Json grabpay;

}
