// File automatically generated from OpenAPI spec.
module stripe.model.person_requirements;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account_requirements_alternative : AccountRequirementsAlternative;
import stripe.model.account_requirements_error : AccountRequirementsError;

/**
 */
class PersonRequirements {
  /**
   * Fields that need to be collected to keep the person's account enabled. If not collected by
   * the account's `current_deadline`, these fields appear in `past_due` as well, and the account
   * is disabled.
   */
  @optional
  string[] currently_due;

  /**
   * Fields that need to be collected assuming all volume thresholds are reached. As they become
   * required, they appear in `currently_due` as well, and the account's `current_deadline`
   * becomes set.
   */
  @optional
  string[] eventually_due;

  /**
   * Fields that weren't collected by the account's `current_deadline`. These fields need to be
   * collected to enable the person's account.
   */
  @optional
  string[] past_due;

  /**
   * Fields that are due and can be satisfied by providing the corresponding alternative fields
   * instead.
   */
  @optional
  AccountRequirementsAlternative[] alternatives;

  /**
   * Fields that are `currently_due` and need to be collected again because validation or
   * verification failed.
   */
  @optional
  AccountRequirementsError[] errors;

  /**
   * Fields that may become required depending on the results of verification or review. Will be
   * an empty array unless an asynchronous verification is pending. If verification fails, these
   * fields move to `eventually_due`, `currently_due`, or `past_due`.
   */
  @optional
  string[] pending_verification;

  mixin AddBuilder!(typeof(this));

}
