// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_lodging_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionLodgingData {
  /**
   * The number of nights stayed at the lodging.
   */
  @optional
  Nullable!(int) nights;

  /**
   * The time of checking into the lodging.
   */
  @optional
  Nullable!(int) check_in_at;

  mixin AddBuilder!(typeof(this));

}
