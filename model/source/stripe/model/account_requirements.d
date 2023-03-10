// File automatically generated from OpenAPI spec.
module stripe.model.account_requirements;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account_requirements_alternative : AccountRequirementsAlternative;
import stripe.model.account_requirements_error : AccountRequirementsError;

/**
 */
class AccountRequirements {
  /**
   * Fields that need to be collected assuming all volume thresholds are reached. As they become
   * required, they appear in `currently_due` as well, and `current_deadline` becomes set.
   */
  @optional
  string[] eventually_due;

  /**
   * Fields that may become required depending on the results of verification or review. Will be
   * an empty array unless an asynchronous verification is pending. If verification fails, these
   * fields move to `eventually_due`, `currently_due`, or `past_due`.
   */
  @optional
  string[] pending_verification;

  /**
   * Fields that weren't collected by `current_deadline`. These fields need to be collected to
   * enable the account.
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
   * Fields that need to be collected to keep the account enabled. If not collected by
   * `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
   */
  @optional
  string[] currently_due;

  /**
   * Fields that are `currently_due` and need to be collected again because validation or
   * verification failed.
   */
  @optional
  AccountRequirementsError[] errors;

  /**
   * Date by which the fields in `currently_due` must be collected to keep the account enabled.
   * These fields may disable the account sooner if the next threshold is reached before they are
   * collected.
   */
  @optional
  Nullable!(long) current_deadline;

  /**
   * If the account is disabled, this string describes why. Can be `requirements.past_due`,
   * `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`,
   * `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.
   */
  @optional
  string disabled_reason;

  mixin AddBuilder!(typeof(this));

}
