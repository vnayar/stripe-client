// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_treasury;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionTreasury {
  /**
   * The Treasury [ReceivedCredit](https://stripe.com/docs/api/treasury/received_credits)
   * representing this Issuing transaction if it is a refund
   */
  @optional
  string received_credit;

  /**
   * The Treasury [ReceivedDebit](https://stripe.com/docs/api/treasury/received_debits)
   * representing this Issuing transaction if it is a capture
   */
  @optional
  string received_debit;

  mixin AddBuilder!(typeof(this));

}
