// File automatically generated from OpenAPI spec.
module stripe.model.identity.verification_session;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.gelato_session_last_error : GelatoSessionLastError;
import stripe.model.gelato_verification_session_options : GelatoVerificationSessionOptions;
import stripe.model.gelato_verified_outputs : GelatoVerifiedOutputs;
import stripe.model.identity.verification_report : IdentityVerificationReport;
import stripe.model.verification_session_redaction : VerificationSessionRedaction;

/**
 * A VerificationSession guides you through the process of collecting and verifying the identities
 * of your users. It contains details about the type of verification, such as what [verification
 * check](/docs/identity/verification-checks) to perform. Only create one VerificationSession for
 * each verification in your system.
 * A VerificationSession transitions through [multiple
 * statuses](/docs/identity/how-sessions-work) throughout its lifetime as it progresses through
 * the verification flow. The VerificationSession contains the user's verified data after
 * verification checks are complete.
 * Related guide: [The Verification Sessions
 * API](https://stripe.com/docs/identity/verification-sessions)
 */
class IdentityVerificationSession {
  /**
   * The user’s verified data.
   */
  @optional
  GelatoVerifiedOutputs verified_outputs;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The short-lived client secret used by Stripe.js to [show a verification
   * modal](https://stripe.com/docs/js/identity/modal) inside your app. This client secret expires
   * after 24 hours and can only be used once. Don’t store it, log it, embed it in a URL, or
   * expose it to anyone other than the user. Make sure that you have TLS enabled on any page that
   * includes the client secret. Refer to our docs on [passing the client secret to the
   * frontend](https://stripe.com/docs/identity/verification-sessions#client-secret) to learn
   * more.
   */
  @optional
  string client_secret;

  /**
   * If present, this property tells you the last error encountered when processing the
   * verification.
   */
  @optional
  GelatoSessionLastError last_error;

  /**
   * The short-lived URL that you use to redirect a user to Stripe to submit their identity
   * information. This URL expires after 48 hours and can only be used once. Don’t store it, log
   * it, send it in emails or expose it to anyone other than the user. Refer to our docs on
   * [verifying identity
   * documents](https://stripe.com/docs/identity/verify-identity-documents?platform=web&type=redir
   * ect) to learn how to redirect users to Stripe.
   */
  @optional
  string url;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be
   * performed.
   */
  @optional
  string type;

  /**
   * ID of the most recent VerificationReport. [Learn more about accessing detailed verification
   * results.](https://stripe.com/docs/identity/verification-sessions#results)
   */
  @optional
  Json last_verification_report;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Redaction status of this VerificationSession. If the VerificationSession is not redacted,
   * this field will be null.
   */
  @optional
  VerificationSessionRedaction redaction;

  @optional
  GelatoVerificationSessionOptions options;

  /**
   * Status of this VerificationSession. [Learn more about the lifecycle of
   * sessions](https://stripe.com/docs/identity/how-sessions-work).
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}
