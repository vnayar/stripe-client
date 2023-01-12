// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_amount_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionAmountDetails {
  /**
   * The fee charged by the ATM for the cash withdrawal.
   */
  @optional
  Nullable!(int) atm_fee;

  mixin AddBuilder!(typeof(this));

}
