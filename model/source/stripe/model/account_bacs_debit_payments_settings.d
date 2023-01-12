// File automatically generated from OpenAPI spec.
module stripe.model.account_bacs_debit_payments_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class AccountBacsDebitPaymentsSettings {
  /**
   * The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct
   * Debit, this will appear on the mandate, and as the statement descriptor.
   */
  @optional
  string display_name;

  mixin AddBuilder!(typeof(this));

}
