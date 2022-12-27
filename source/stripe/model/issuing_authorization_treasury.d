// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_treasury;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationTreasury {
  /**
   * The array of [ReceivedCredits](https://stripe.com/docs/api/treasury/received_credits)
   * associated with this authorization
   */
  @optional
  Nullable!(string)[] received_credits;

  /**
   * The Treasury [Transaction](https://stripe.com/docs/api/treasury/transactions) associated with
   * this authorization
   */
  @optional
  Nullable!(string) transaction;

  /**
   * The array of [ReceivedDebits](https://stripe.com/docs/api/treasury/received_debits)
   * associated with this authorization
   */
  @optional
  Nullable!(string)[] received_debits;

}
