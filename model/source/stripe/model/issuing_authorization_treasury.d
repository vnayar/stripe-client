// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_treasury;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationTreasury {
  /**
   * The array of [ReceivedCredits](https://stripe.com/docs/api/treasury/received_credits)
   * associated with this authorization
   */
  @optional
  string[] received_credits;

  /**
   * The Treasury [Transaction](https://stripe.com/docs/api/treasury/transactions) associated with
   * this authorization
   */
  @optional
  string transaction;

  /**
   * The array of [ReceivedDebits](https://stripe.com/docs/api/treasury/received_debits)
   * associated with this authorization
   */
  @optional
  string[] received_debits;

  mixin AddBuilder!(typeof(this));

}
