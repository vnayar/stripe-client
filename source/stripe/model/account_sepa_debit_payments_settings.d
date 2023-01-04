// File automatically generated from OpenAPI spec.
module stripe.model.account_sepa_debit_payments_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AccountSepaDebitPaymentsSettings {
  /**
   * SEPA creditor identifier that identifies the company making the payment.
   */
  @optional
  string creditor_id;

}
