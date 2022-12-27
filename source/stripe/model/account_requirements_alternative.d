// File automatically generated from OpenAPI spec.
module stripe.model.account_requirements_alternative;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AccountRequirementsAlternative {
  /**
   * Fields that are due and can be satisfied by providing all fields in `alternative_fields_due`.
   */
  @optional
  Nullable!(string)[] original_fields_due;

  /**
   * Fields that can be provided to satisfy all fields in `original_fields_due`.
   */
  @optional
  Nullable!(string)[] alternative_fields_due;

}
