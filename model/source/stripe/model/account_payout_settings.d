// File automatically generated from OpenAPI spec.
module stripe.model.account_payout_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.transfer_schedule : TransferSchedule;

/**
 */
class AccountPayoutSettings {
  /**
   * The text that appears on the bank account statement for payouts. If not set, this defaults to
   * the platform's bank descriptor as set in the Dashboard.
   */
  @optional
  string statement_descriptor;

  /**
   * A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank
   * account. See our [Understanding Connect Account
   * Balances](https://stripe.com/docs/connect/account-balances) documentation for details.
   * Default value is `false` for Custom accounts, otherwise `true`.
   */
  @optional
  Nullable!(bool) debit_negative_balances;

  @optional
  TransferSchedule schedule;

  mixin AddBuilder!(typeof(this));

}
