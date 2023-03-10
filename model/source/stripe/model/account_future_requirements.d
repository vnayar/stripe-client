// File automatically generated from OpenAPI spec.
module stripe.model.account_future_requirements;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account_requirements_alternative : AccountRequirementsAlternative;
import stripe.model.account_requirements_error : AccountRequirementsError;

/**
 */
class AccountFutureRequirements {
  /**
   * Fields that need to be collected assuming all volume thresholds are reached. As they become
   * required, they appear in `currently_due` as well.
   */
  @optional
  string[] eventually_due;

  /**
   * Fields that may become required depending on the results of verification or review. Will be
   * an empty array unless an asynchronous verification is pending. If verification fails, these
   * fields move to `eventually_due` or `currently_due`.
   */
  @optional
  string[] pending_verification;

  /**
   * Fields that weren't collected by `requirements.current_deadline`. These fields need to be
   * collected to enable the capability on the account. New fields will never appear here;
   * `future_requirements.past_due` will always be a subset of `requirements.past_due`.
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
   * `future_requirements[current_deadline]`, these fields will transition to the main
   * `requirements` hash.
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
   * Date on which `future_requirements` merges with the main `requirements` hash and
   * `future_requirements` becomes empty. After the transition, `currently_due` requirements may
   * immediately become `past_due`, but the account may also be given a grace period depending on
   * its enablement state prior to transitioning.
   */
  @optional
  Nullable!(long) current_deadline;

  /**
   * This is typed as a string for consistency with `requirements.disabled_reason`, but it safe to
   * assume `future_requirements.disabled_reason` is empty because fields in `future_requirements`
   * will never disable the account.
   */
  @optional
  string disabled_reason;

  mixin AddBuilder!(typeof(this));

}
