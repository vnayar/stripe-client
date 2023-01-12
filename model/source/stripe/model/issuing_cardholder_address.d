// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_address;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class IssuingCardholderAddress {
  @optional
  Address address;

  mixin AddBuilder!(typeof(this));

}
