// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_amount_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationAmountDetails {
  /**
   * The fee charged by the ATM for the cash withdrawal.
   */
  @optional
  Nullable!(int) atm_fee;

}
