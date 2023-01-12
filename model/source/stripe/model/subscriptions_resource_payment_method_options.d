// File automatically generated from OpenAPI spec.
module stripe.model.subscriptions_resource_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice_payment_method_options_acss_debit : InvoicePaymentMethodOptionsAcssDebit;
import stripe.model.invoice_payment_method_options_bancontact : InvoicePaymentMethodOptionsBancontact;
import stripe.model.invoice_payment_method_options_customer_balance : InvoicePaymentMethodOptionsCustomerBalance;
import stripe.model.invoice_payment_method_options_konbini : InvoicePaymentMethodOptionsKonbini;
import stripe.model.invoice_payment_method_options_us_bank_account : InvoicePaymentMethodOptionsUsBankAccount;
import stripe.model.subscription_payment_method_options_card : SubscriptionPaymentMethodOptionsCard;

/**
 */
class SubscriptionsResourcePaymentMethodOptions {
  /**
   * This sub-hash contains details about the Card payment method options to pass to invoices
   * created by the subscription.
   */
  @optional
  SubscriptionPaymentMethodOptionsCard card;

  /**
   * This sub-hash contains details about the Bancontact payment method options to pass to
   * invoices created by the subscription.
   */
  @optional
  InvoicePaymentMethodOptionsBancontact bancontact;

  /**
   * This sub-hash contains details about the Konbini payment method options to pass to invoices
   * created by the subscription.
   */
  @optional
  InvoicePaymentMethodOptionsKonbini konbini;

  /**
   * This sub-hash contains details about the Canadian pre-authorized debit payment method options
   * to pass to invoices created by the subscription.
   */
  @optional
  InvoicePaymentMethodOptionsAcssDebit acss_debit;

  /**
   * This sub-hash contains details about the Bank transfer payment method options to pass to
   * invoices created by the subscription.
   */
  @optional
  InvoicePaymentMethodOptionsCustomerBalance customer_balance;

  /**
   * This sub-hash contains details about the ACH direct debit payment method options to pass to
   * invoices created by the subscription.
   */
  @optional
  InvoicePaymentMethodOptionsUsBankAccount us_bank_account;

  mixin AddBuilder!(typeof(this));

}
