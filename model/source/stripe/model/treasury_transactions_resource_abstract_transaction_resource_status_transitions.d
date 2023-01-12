// File automatically generated from OpenAPI spec.
module stripe.model.treasury_transactions_resource_abstract_transaction_resource_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class TreasuryTransactionsResourceAbstractTransactionResourceStatusTransitions {
  /**
   * Timestamp describing when the Transaction changed status to `void`.
   */
  @optional
  Nullable!(long) void_at;

  /**
   * Timestamp describing when the Transaction changed status to `posted`.
   */
  @optional
  Nullable!(long) posted_at;

  mixin AddBuilder!(typeof(this));

}
