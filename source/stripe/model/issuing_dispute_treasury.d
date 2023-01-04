// File automatically generated from OpenAPI spec.
module stripe.model.issuing_dispute_treasury;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingDisputeTreasury {
  /**
   * The Treasury [DebitReversal](https://stripe.com/docs/api/treasury/debit_reversals)
   * representing this Issuing dispute
   */
  @optional
  string debit_reversal;

  /**
   * The Treasury [ReceivedDebit](https://stripe.com/docs/api/treasury/received_debits) that is
   * being disputed.
   */
  @optional
  string received_debit;

}
