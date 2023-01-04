// File automatically generated from OpenAPI spec.
module stripe.model.rule;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class Rule {
  /**
   * The action taken on the payment.
   */
  @optional
  string action;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The predicate to evaluate the payment against.
   */
  @optional
  string predicate;

}
