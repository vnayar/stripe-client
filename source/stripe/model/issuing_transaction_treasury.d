// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_treasury;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionTreasury {
  /**
   * The Treasury [ReceivedCredit](https://stripe.com/docs/api/treasury/received_credits)
   * representing this Issuing transaction if it is a refund
   */
  @optional
  Nullable!(string) received_credit;

  /**
   * The Treasury [ReceivedDebit](https://stripe.com/docs/api/treasury/received_debits)
   * representing this Issuing transaction if it is a capture
   */
  @optional
  Nullable!(string) received_debit;

}
