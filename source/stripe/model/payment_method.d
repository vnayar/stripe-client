// File automatically generated from OpenAPI spec.
module stripe.model.payment_method;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.billing_details : BillingDetails;
import stripe.model.customer : Customer;
import stripe.model.payment_flows_private_payment_methods_alipay : PaymentFlowsPrivatePaymentMethodsAlipay;
import stripe.model.payment_method_acss_debit : PaymentMethodAcssDebit;
import stripe.model.payment_method_affirm : PaymentMethodAffirm;
import stripe.model.payment_method_afterpay_clearpay : PaymentMethodAfterpayClearpay;
import stripe.model.payment_method_au_becs_debit : PaymentMethodAuBecsDebit;
import stripe.model.payment_method_bacs_debit : PaymentMethodBacsDebit;
import stripe.model.payment_method_bancontact : PaymentMethodBancontact;
import stripe.model.payment_method_blik : PaymentMethodBlik;
import stripe.model.payment_method_boleto : PaymentMethodBoleto;
import stripe.model.payment_method_card : PaymentMethodCard;
import stripe.model.payment_method_card_present : PaymentMethodCardPresent;
import stripe.model.payment_method_customer_balance : PaymentMethodCustomerBalance;
import stripe.model.payment_method_eps : PaymentMethodEps;
import stripe.model.payment_method_fpx : PaymentMethodFpx;
import stripe.model.payment_method_giropay : PaymentMethodGiropay;
import stripe.model.payment_method_grabpay : PaymentMethodGrabpay;
import stripe.model.payment_method_ideal : PaymentMethodIdeal;
import stripe.model.payment_method_interac_present : PaymentMethodInteracPresent;
import stripe.model.payment_method_klarna : PaymentMethodKlarna;
import stripe.model.payment_method_konbini : PaymentMethodKonbini;
import stripe.model.payment_method_link : PaymentMethodLink;
import stripe.model.payment_method_oxxo : PaymentMethodOxxo;
import stripe.model.payment_method_p24 : PaymentMethodP24;
import stripe.model.payment_method_paynow : PaymentMethodPaynow;
import stripe.model.payment_method_pix : PaymentMethodPix;
import stripe.model.payment_method_promptpay : PaymentMethodPromptpay;
import stripe.model.payment_method_sepa_debit : PaymentMethodSepaDebit;
import stripe.model.payment_method_sofort : PaymentMethodSofort;
import stripe.model.payment_method_us_bank_account : PaymentMethodUsBankAccount;
import stripe.model.payment_method_wechat_pay : PaymentMethodWechatPay;
import stripe.model.radar_radar_options : RadarRadarOptions;

/**
 * PaymentMethod objects represent your customer's payment instruments.
 * You can use them with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to
 * collect payments or save them to
 * Customer objects to store instrument details for future payments.
 * Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More
 * Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
 */
class PaymentMethod {
  @optional
  PaymentMethodWechatPay wechat_pay;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  @optional
  PaymentMethodGiropay giropay;

  @optional
  PaymentMethodIdeal ideal;

  @optional
  PaymentMethodBacsDebit bacs_debit;

  @optional
  PaymentMethodCard card;

  @optional
  PaymentMethodCardPresent card_present;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  PaymentMethodAcssDebit acss_debit;

  @optional
  PaymentMethodBancontact bancontact;

  @optional
  PaymentMethodCustomerBalance customer_balance;

  @optional
  PaymentFlowsPrivatePaymentMethodsAlipay alipay;

  @optional
  PaymentMethodEps eps;

  /**
   * The ID of the Customer to which this PaymentMethod is saved. This will not be set when the
   * PaymentMethod has not been saved to a Customer.
   */
  @optional
  Json customer;

  @optional
  PaymentMethodUsBankAccount us_bank_account;

  @optional
  PaymentMethodPromptpay promptpay;

  @optional
  PaymentMethodBoleto boleto;

  @optional
  PaymentMethodSofort sofort;

  @optional
  PaymentMethodKonbini konbini;

  @optional
  PaymentMethodFpx fpx;

  @optional
  PaymentMethodBlik blik;

  @optional
  PaymentMethodPaynow paynow;

  @optional
  RadarRadarOptions radar_options;

  @optional
  PaymentMethodP24 p24;

  @optional
  PaymentMethodPix pix;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  @optional
  PaymentMethodLink link;

  /**
   * The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a
   * name matching this value. It contains additional information specific to the PaymentMethod
   * type.
   */
  @optional
  string type;

  @optional
  BillingDetails billing_details;

  @optional
  PaymentMethodAuBecsDebit au_becs_debit;

  @optional
  PaymentMethodKlarna klarna;

  @optional
  PaymentMethodSepaDebit sepa_debit;

  @optional
  PaymentMethodAfterpayClearpay afterpay_clearpay;

  @optional
  PaymentMethodAffirm affirm;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  @optional
  PaymentMethodInteracPresent interac_present;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  PaymentMethodOxxo oxxo;

  @optional
  PaymentMethodGrabpay grabpay;

}
