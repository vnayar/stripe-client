// File automatically generated from OpenAPI spec.
module stripe.model.account_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account_bacs_debit_payments_settings : AccountBacsDebitPaymentsSettings;
import stripe.model.account_branding_settings : AccountBrandingSettings;
import stripe.model.account_card_issuing_settings : AccountCardIssuingSettings;
import stripe.model.account_card_payments_settings : AccountCardPaymentsSettings;
import stripe.model.account_dashboard_settings : AccountDashboardSettings;
import stripe.model.account_payments_settings : AccountPaymentsSettings;
import stripe.model.account_payout_settings : AccountPayoutSettings;
import stripe.model.account_sepa_debit_payments_settings : AccountSepaDebitPaymentsSettings;
import stripe.model.account_treasury_settings : AccountTreasurySettings;

/**
 */
class AccountSettings {
  @optional
  AccountBacsDebitPaymentsSettings bacs_debit_payments;

  @optional
  AccountPayoutSettings payouts;

  @optional
  AccountCardPaymentsSettings card_payments;

  @optional
  AccountSepaDebitPaymentsSettings sepa_debit_payments;

  @optional
  AccountCardIssuingSettings card_issuing;

  @optional
  AccountPaymentsSettings payments;

  @optional
  AccountTreasurySettings treasury;

  @optional
  AccountDashboardSettings dashboard;

  @optional
  AccountBrandingSettings branding;

}
