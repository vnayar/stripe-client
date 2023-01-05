// File automatically generated from OpenAPI spec.
module stripe.model.balance_amount_by_source_type;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class BalanceAmountBySourceType {
  /**
   * Amount for card.
   */
  @optional
  Nullable!(int) card;

  /**
   * Amount for bank account.
   */
  @optional
  Nullable!(int) bank_account;

  /**
   * Amount for FPX.
   */
  @optional
  Nullable!(int) fpx;

  mixin AddBuilder!(typeof(this));

}
