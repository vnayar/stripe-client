// File automatically generated from OpenAPI spec.
module stripe.model.account_requirements_alternative;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class AccountRequirementsAlternative {
  /**
   * Fields that are due and can be satisfied by providing all fields in `alternative_fields_due`.
   */
  @optional
  string[] original_fields_due;

  /**
   * Fields that can be provided to satisfy all fields in `original_fields_due`.
   */
  @optional
  string[] alternative_fields_due;

  mixin AddBuilder!(typeof(this));

}
