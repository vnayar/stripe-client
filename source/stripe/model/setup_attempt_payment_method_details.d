// File automatically generated from OpenAPI spec.
module stripe.model.setup_attempt_payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.setup_attempt_payment_method_details_acss_debit : SetupAttemptPaymentMethodDetailsAcssDebit;
import stripe.model.setup_attempt_payment_method_details_au_becs_debit : SetupAttemptPaymentMethodDetailsAuBecsDebit;
import stripe.model.setup_attempt_payment_method_details_bacs_debit : SetupAttemptPaymentMethodDetailsBacsDebit;
import stripe.model.setup_attempt_payment_method_details_bancontact : SetupAttemptPaymentMethodDetailsBancontact;
import stripe.model.setup_attempt_payment_method_details_blik : SetupAttemptPaymentMethodDetailsBlik;
import stripe.model.setup_attempt_payment_method_details_boleto : SetupAttemptPaymentMethodDetailsBoleto;
import stripe.model.setup_attempt_payment_method_details_card : SetupAttemptPaymentMethodDetailsCard;
import stripe.model.setup_attempt_payment_method_details_card_present : SetupAttemptPaymentMethodDetailsCardPresent;
import stripe.model.setup_attempt_payment_method_details_ideal : SetupAttemptPaymentMethodDetailsIdeal;
import stripe.model.setup_attempt_payment_method_details_klarna : SetupAttemptPaymentMethodDetailsKlarna;
import stripe.model.setup_attempt_payment_method_details_link : SetupAttemptPaymentMethodDetailsLink;
import stripe.model.setup_attempt_payment_method_details_sepa_debit : SetupAttemptPaymentMethodDetailsSepaDebit;
import stripe.model.setup_attempt_payment_method_details_sofort : SetupAttemptPaymentMethodDetailsSofort;
import stripe.model.setup_attempt_payment_method_details_us_bank_account : SetupAttemptPaymentMethodDetailsUsBankAccount;

/**
 */
class SetupAttemptPaymentMethodDetails {
  @optional
  SetupAttemptPaymentMethodDetailsBancontact bancontact;

  @optional
  SetupAttemptPaymentMethodDetailsAuBecsDebit au_becs_debit;

  @optional
  SetupAttemptPaymentMethodDetailsKlarna klarna;

  @optional
  SetupAttemptPaymentMethodDetailsUsBankAccount us_bank_account;

  @optional
  SetupAttemptPaymentMethodDetailsIdeal ideal;

  @optional
  SetupAttemptPaymentMethodDetailsBacsDebit bacs_debit;

  @optional
  SetupAttemptPaymentMethodDetailsBoleto boleto;

  @optional
  SetupAttemptPaymentMethodDetailsSepaDebit sepa_debit;

  @optional
  SetupAttemptPaymentMethodDetailsCard card;

  @optional
  SetupAttemptPaymentMethodDetailsLink link;

  @optional
  SetupAttemptPaymentMethodDetailsSofort sofort;

  @optional
  SetupAttemptPaymentMethodDetailsCardPresent card_present;

  @optional
  SetupAttemptPaymentMethodDetailsBlik blik;

  /**
   * The type of the payment method used in the SetupIntent (e.g., `card`). An additional hash is
   * included on `payment_method_details` with a name matching this value. It contains
   * confirmation-specific information for the payment method.
   */
  @optional
  string type;

  @optional
  SetupAttemptPaymentMethodDetailsAcssDebit acss_debit;

}
