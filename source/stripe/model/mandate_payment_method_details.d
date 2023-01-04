// File automatically generated from OpenAPI spec.
module stripe.model.mandate_payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.card_mandate_payment_method_details : CardMandatePaymentMethodDetails;
import stripe.model.mandate_acss_debit : MandateAcssDebit;
import stripe.model.mandate_au_becs_debit : MandateAuBecsDebit;
import stripe.model.mandate_bacs_debit : MandateBacsDebit;
import stripe.model.mandate_blik : MandateBlik;
import stripe.model.mandate_link : MandateLink;
import stripe.model.mandate_sepa_debit : MandateSepaDebit;
import stripe.model.mandate_us_bank_account : MandateUsBankAccount;

/**
 */
class MandatePaymentMethodDetails {
  @optional
  MandateAuBecsDebit au_becs_debit;

  @optional
  MandateUsBankAccount us_bank_account;

  @optional
  MandateBacsDebit bacs_debit;

  @optional
  MandateSepaDebit sepa_debit;

  @optional
  CardMandatePaymentMethodDetails card;

  @optional
  MandateLink link;

  @optional
  MandateBlik blik;

  /**
   * The type of the payment method associated with this mandate. An additional hash is included
   * on `payment_method_details` with a name matching this value. It contains mandate information
   * specific to the payment method.
   */
  @optional
  string type;

  @optional
  MandateAcssDebit acss_debit;

}
