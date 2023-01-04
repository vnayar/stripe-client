// File automatically generated from OpenAPI spec.
module stripe.model.balance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_amount : BalanceAmount;
import stripe.model.balance_detail : BalanceDetail;

/**
 * This is an object representing your Stripe balance. You can retrieve it to see
 * the balance currently on your Stripe account.
 * You can also retrieve the balance history, which contains a list of
 * [transactions](https://stripe.com/docs/reporting/balance-transaction-types) that contributed to
 * the balance
 * (charges, payouts, and so forth).
 * The available and pending amounts for each currency are broken down further by
 * payment source types.
 * Related guide: [Understanding Connect Account
 * Balances](https://stripe.com/docs/connect/account-balances).
 */
class Balance {
  /**
   * Funds held due to negative balances on connected Custom accounts. The connect reserve balance
   * for each currency and payment type can be found in the `source_types` property.
   */
  @optional
  BalanceAmount[] connect_reserved;

  /**
   * Funds that can be paid out using Instant Payouts.
   */
  @optional
  BalanceAmount[] instant_available;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Funds that are not yet available in the balance, due to the 7-day rolling pay cycle. The
   * pending balance for each currency, and for each payment type, can be found in the
   * `source_types` property.
   */
  @optional
  BalanceAmount[] pending;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Funds that are available to be transferred or paid out, whether automatically by Stripe or
   * explicitly via the [Transfers API](https://stripe.com/docs/api#transfers) or [Payouts
   * API](https://stripe.com/docs/api#payouts). The available balance for each currency and
   * payment type can be found in the `source_types` property.
   */
  @optional
  BalanceAmount[] available;

  @optional
  BalanceDetail issuing;

}
