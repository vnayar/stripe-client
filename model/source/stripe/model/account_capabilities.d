// File automatically generated from OpenAPI spec.
module stripe.model.account_capabilities;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class AccountCapabilities {
  /**
   * The status of the konbini payments capability of the account, or whether the account can
   * directly process konbini charges.
   */
  @optional
  string konbini_payments;

  /**
   * The status of the blik payments capability of the account, or whether the account can
   * directly process blik charges.
   */
  @optional
  string blik_payments;

  /**
   * The status of the SEPA Direct Debits payments capability of the account, or whether the
   * account can directly process SEPA Direct Debits charges.
   */
  @optional
  string sepa_debit_payments;

  /**
   * The status of the BECS Direct Debit (AU) payments capability of the account, or whether the
   * account can directly process BECS Direct Debit (AU) charges.
   */
  @optional
  string au_becs_debit_payments;

  /**
   * The status of the card issuing capability of the account, or whether you can use Issuing to
   * distribute funds on cards
   */
  @optional
  string card_issuing;

  /**
   * The status of the OXXO payments capability of the account, or whether the account can
   * directly process OXXO charges.
   */
  @optional
  string oxxo_payments;

  /**
   * The status of the iDEAL payments capability of the account, or whether the account can
   * directly process iDEAL charges.
   */
  @optional
  string ideal_payments;

  /**
   * The status of the JCB payments capability of the account, or whether the account (Japan only)
   * can directly process JCB credit card charges in JPY currency.
   */
  @optional
  string jcb_payments;

  /**
   * The status of the US bank account ACH payments capability of the account, or whether the
   * account can directly process US bank account charges.
   */
  @optional
  string us_bank_account_ach_payments;

  /**
   * The status of the Cartes Bancaires payments capability of the account, or whether the account
   * can directly process Cartes Bancaires card charges in EUR currency.
   */
  @optional
  string cartes_bancaires_payments;

  /**
   * The status of the tax reporting 1099-K (US) capability of the account.
   */
  @optional
  string tax_reporting_us_1099_k;

  /**
   * The status of the transfers capability of the account, or whether your platform can transfer
   * funds to the account.
   */
  @optional
  string transfers;

  /**
   * The status of the promptpay payments capability of the account, or whether the account can
   * directly process promptpay charges.
   */
  @optional
  string promptpay_payments;

  /**
   * The status of the GrabPay payments capability of the account, or whether the account can
   * directly process GrabPay charges.
   */
  @optional
  string grabpay_payments;

  /**
   * The status of the card payments capability of the account, or whether the account can
   * directly process credit and debit card charges.
   */
  @optional
  string card_payments;

  /**
   * The status of the Bancontact payments capability of the account, or whether the account can
   * directly process Bancontact charges.
   */
  @optional
  string bancontact_payments;

  /**
   * The status of the Sofort payments capability of the account, or whether the account can
   * directly process Sofort charges.
   */
  @optional
  string sofort_payments;

  /**
   * The status of the banking capability, or whether the account can have bank accounts.
   */
  @optional
  string treasury;

  /**
   * The status of the P24 payments capability of the account, or whether the account can directly
   * process P24 charges.
   */
  @optional
  string p24_payments;

  /**
   * The status of the Bacs Direct Debits payments capability of the account, or whether the
   * account can directly process Bacs Direct Debits charges.
   */
  @optional
  string bacs_debit_payments;

  /**
   * The status of the Klarna payments capability of the account, or whether the account can
   * directly process Klarna charges.
   */
  @optional
  string klarna_payments;

  /**
   * The status of the legacy payments capability of the account.
   */
  @optional
  string legacy_payments;

  /**
   * The status of the paynow payments capability of the account, or whether the account can
   * directly process paynow charges.
   */
  @optional
  string paynow_payments;

  /**
   * The status of the Afterpay Clearpay capability of the account, or whether the account can
   * directly process Afterpay Clearpay charges.
   */
  @optional
  string afterpay_clearpay_payments;

  /**
   * The status of the boleto payments capability of the account, or whether the account can
   * directly process boleto charges.
   */
  @optional
  string boleto_payments;

  /**
   * The status of the FPX payments capability of the account, or whether the account can directly
   * process FPX charges.
   */
  @optional
  string fpx_payments;

  /**
   * The status of the india_international_payments capability of the account, or whether the
   * account can process international charges (non INR) in India.
   */
  @optional
  string india_international_payments;

  /**
   * The status of the tax reporting 1099-MISC (US) capability of the account.
   */
  @optional
  string tax_reporting_us_1099_misc;

  /**
   * The status of the giropay payments capability of the account, or whether the account can
   * directly process giropay charges.
   */
  @optional
  string giropay_payments;

  /**
   * The status of the customer_balance payments capability of the account, or whether the account
   * can directly process customer_balance charges.
   */
  @optional
  string bank_transfer_payments;

  /**
   * The status of the EPS payments capability of the account, or whether the account can directly
   * process EPS charges.
   */
  @optional
  string eps_payments;

  /**
   * The status of the Affirm capability of the account, or whether the account can directly
   * process Affirm charges.
   */
  @optional
  string affirm_payments;

  /**
   * The status of the link_payments capability of the account, or whether the account can
   * directly process Link charges.
   */
  @optional
  string link_payments;

  /**
   * The status of the Canadian pre-authorized debits payments capability of the account, or
   * whether the account can directly process Canadian pre-authorized debits charges.
   */
  @optional
  string acss_debit_payments;

  mixin AddBuilder!(typeof(this));

}
