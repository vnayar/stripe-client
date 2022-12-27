// File automatically generated from OpenAPI spec.
module stripe.model.invoices_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.invoice_payment_method_options_acss_debit : InvoicePaymentMethodOptionsAcssDebit;
import stripe.model.invoice_payment_method_options_bancontact : InvoicePaymentMethodOptionsBancontact;
import stripe.model.invoice_payment_method_options_card : InvoicePaymentMethodOptionsCard;
import stripe.model.invoice_payment_method_options_customer_balance : InvoicePaymentMethodOptionsCustomerBalance;
import stripe.model.invoice_payment_method_options_konbini : InvoicePaymentMethodOptionsKonbini;
import stripe.model.invoice_payment_method_options_us_bank_account : InvoicePaymentMethodOptionsUsBankAccount;

/**
 */
class InvoicesPaymentMethodOptions {
  /**
   * If paying by `card`, this sub-hash contains details about the Card payment method options to
   * pass to the invoice’s PaymentIntent.
   */
  @optional
  InvoicePaymentMethodOptionsCard card;

  /**
   * If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method
   * options to pass to the invoice’s PaymentIntent.
   */
  @optional
  InvoicePaymentMethodOptionsBancontact bancontact;

  /**
   * If paying by `konbini`, this sub-hash contains details about the Konbini payment method
   * options to pass to the invoice’s PaymentIntent.
   */
  @optional
  InvoicePaymentMethodOptionsKonbini konbini;

  /**
   * If paying by `acss_debit`, this sub-hash contains details about the Canadian pre-authorized
   * debit payment method options to pass to the invoice’s PaymentIntent.
   */
  @optional
  InvoicePaymentMethodOptionsAcssDebit acss_debit;

  /**
   * If paying by `customer_balance`, this sub-hash contains details about the Bank transfer
   * payment method options to pass to the invoice’s PaymentIntent.
   */
  @optional
  InvoicePaymentMethodOptionsCustomerBalance customer_balance;

  /**
   * If paying by `us_bank_account`, this sub-hash contains details about the ACH direct debit
   * payment method options to pass to the invoice’s PaymentIntent.
   */
  @optional
  InvoicePaymentMethodOptionsUsBankAccount us_bank_account;

}
