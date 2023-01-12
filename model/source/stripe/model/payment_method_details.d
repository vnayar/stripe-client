// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_flows_private_payment_methods_alipay_details : PaymentFlowsPrivatePaymentMethodsAlipayDetails;
import stripe.model.payment_method_details_ach_credit_transfer : PaymentMethodDetailsAchCreditTransfer;
import stripe.model.payment_method_details_ach_debit : PaymentMethodDetailsAchDebit;
import stripe.model.payment_method_details_acss_debit : PaymentMethodDetailsAcssDebit;
import stripe.model.payment_method_details_affirm : PaymentMethodDetailsAffirm;
import stripe.model.payment_method_details_afterpay_clearpay : PaymentMethodDetailsAfterpayClearpay;
import stripe.model.payment_method_details_au_becs_debit : PaymentMethodDetailsAuBecsDebit;
import stripe.model.payment_method_details_bacs_debit : PaymentMethodDetailsBacsDebit;
import stripe.model.payment_method_details_bancontact : PaymentMethodDetailsBancontact;
import stripe.model.payment_method_details_blik : PaymentMethodDetailsBlik;
import stripe.model.payment_method_details_boleto : PaymentMethodDetailsBoleto;
import stripe.model.payment_method_details_card : PaymentMethodDetailsCard;
import stripe.model.payment_method_details_card_present : PaymentMethodDetailsCardPresent;
import stripe.model.payment_method_details_customer_balance : PaymentMethodDetailsCustomerBalance;
import stripe.model.payment_method_details_eps : PaymentMethodDetailsEps;
import stripe.model.payment_method_details_fpx : PaymentMethodDetailsFpx;
import stripe.model.payment_method_details_giropay : PaymentMethodDetailsGiropay;
import stripe.model.payment_method_details_grabpay : PaymentMethodDetailsGrabpay;
import stripe.model.payment_method_details_ideal : PaymentMethodDetailsIdeal;
import stripe.model.payment_method_details_interac_present : PaymentMethodDetailsInteracPresent;
import stripe.model.payment_method_details_klarna : PaymentMethodDetailsKlarna;
import stripe.model.payment_method_details_konbini : PaymentMethodDetailsKonbini;
import stripe.model.payment_method_details_link : PaymentMethodDetailsLink;
import stripe.model.payment_method_details_multibanco : PaymentMethodDetailsMultibanco;
import stripe.model.payment_method_details_oxxo : PaymentMethodDetailsOxxo;
import stripe.model.payment_method_details_p24 : PaymentMethodDetailsP24;
import stripe.model.payment_method_details_paynow : PaymentMethodDetailsPaynow;
import stripe.model.payment_method_details_pix : PaymentMethodDetailsPix;
import stripe.model.payment_method_details_promptpay : PaymentMethodDetailsPromptpay;
import stripe.model.payment_method_details_sepa_debit : PaymentMethodDetailsSepaDebit;
import stripe.model.payment_method_details_sofort : PaymentMethodDetailsSofort;
import stripe.model.payment_method_details_stripe_account : PaymentMethodDetailsStripeAccount;
import stripe.model.payment_method_details_us_bank_account : PaymentMethodDetailsUsBankAccount;
import stripe.model.payment_method_details_wechat : PaymentMethodDetailsWechat;
import stripe.model.payment_method_details_wechat_pay : PaymentMethodDetailsWechatPay;

/**
 */
class PaymentMethodDetails {
  @optional
  PaymentMethodDetailsWechatPay wechat_pay;

  @optional
  PaymentMethodDetailsGiropay giropay;

  @optional
  PaymentMethodDetailsIdeal ideal;

  @optional
  PaymentMethodDetailsBacsDebit bacs_debit;

  @optional
  PaymentMethodDetailsCard card;

  @optional
  PaymentMethodDetailsCardPresent card_present;

  @optional
  PaymentMethodDetailsWechat wechat;

  @optional
  PaymentMethodDetailsAchDebit ach_debit;

  @optional
  PaymentMethodDetailsAcssDebit acss_debit;

  @optional
  PaymentMethodDetailsBancontact bancontact;

  @optional
  PaymentMethodDetailsAchCreditTransfer ach_credit_transfer;

  @optional
  PaymentMethodDetailsCustomerBalance customer_balance;

  @optional
  PaymentFlowsPrivatePaymentMethodsAlipayDetails alipay;

  @optional
  PaymentMethodDetailsEps eps;

  @optional
  PaymentMethodDetailsUsBankAccount us_bank_account;

  @optional
  PaymentMethodDetailsPromptpay promptpay;

  @optional
  PaymentMethodDetailsBoleto boleto;

  @optional
  PaymentMethodDetailsSofort sofort;

  @optional
  PaymentMethodDetailsKonbini konbini;

  @optional
  PaymentMethodDetailsFpx fpx;

  @optional
  PaymentMethodDetailsStripeAccount stripe_account;

  @optional
  PaymentMethodDetailsBlik blik;

  @optional
  PaymentMethodDetailsPaynow paynow;

  @optional
  PaymentMethodDetailsP24 p24;

  @optional
  PaymentMethodDetailsPix pix;

  @optional
  PaymentMethodDetailsLink link;

  @optional
  PaymentMethodDetailsMultibanco multibanco;

  /**
   * The type of transaction-specific details of the payment method used in the payment, one of
   * `ach_credit_transfer`, `ach_debit`, `acss_debit`, `alipay`, `au_becs_debit`, `bancontact`,
   * `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`,
   * `sepa_debit`, `sofort`, `stripe_account`, or `wechat`.
   * An additional hash is included on `payment_method_details` with a name matching this value.
   * It contains information specific to the payment method.
   */
  @optional
  string type;

  @optional
  PaymentMethodDetailsAuBecsDebit au_becs_debit;

  @optional
  PaymentMethodDetailsKlarna klarna;

  @optional
  PaymentMethodDetailsSepaDebit sepa_debit;

  @optional
  PaymentMethodDetailsAfterpayClearpay afterpay_clearpay;

  @optional
  PaymentMethodDetailsAffirm affirm;

  @optional
  PaymentMethodDetailsInteracPresent interac_present;

  @optional
  PaymentMethodDetailsOxxo oxxo;

  @optional
  PaymentMethodDetailsGrabpay grabpay;

  mixin AddBuilder!(typeof(this));

}
