// File automatically generated from OpenAPI spec.
module stripe.model.source_owner;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class SourceOwner {
  /**
   * Owner's email address.
   */
  @optional
  string email;

  /**
   * Verified owner's phone number (including extension). Verified values are verified or provided
   * by the payment method directly (and if supported) at the time of authorization or settlement.
   * They cannot be set or mutated.
   */
  @optional
  string verified_phone;

  /**
   * Verified owner's address. Verified values are verified or provided by the payment method
   * directly (and if supported) at the time of authorization or settlement. They cannot be set or
   * mutated.
   */
  @optional
  Address verified_address;

  /**
   * Verified owner's full name. Verified values are verified or provided by the payment method
   * directly (and if supported) at the time of authorization or settlement. They cannot be set or
   * mutated.
   */
  @optional
  string verified_name;

  /**
   * Verified owner's email address. Verified values are verified or provided by the payment
   * method directly (and if supported) at the time of authorization or settlement. They cannot be
   * set or mutated.
   */
  @optional
  string verified_email;

  /**
   * Owner's full name.
   */
  @optional
  string name;

  /**
   * Owner's phone number (including extension).
   */
  @optional
  string phone;

  /**
   * Owner's address.
   */
  @optional
  Address address;

  mixin AddBuilder!(typeof(this));

}
