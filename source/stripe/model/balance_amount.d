// File automatically generated from OpenAPI spec.
module stripe.model.balance_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_amount_by_source_type : BalanceAmountBySourceType;

/**
 */
class BalanceAmount {
  /**
   * Balance amount.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  @optional
  BalanceAmountBySourceType source_types;

}
