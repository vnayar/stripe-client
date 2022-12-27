// File automatically generated from OpenAPI spec.
module stripe.model.source_redirect_flow;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceRedirectFlow {
  /**
   * The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out
   * of the redirect flow), `declined` (the authentication failed or the transaction was
   * declined), or `processing_error` (the redirect failed due to a technical error). Present only
   * if the redirect status is `failed`.
   */
  @optional
  Nullable!(string) failure_reason;

  /**
   * The URL you provide to redirect the customer to after they authenticated their payment.
   */
  @optional
  Nullable!(string) return_url;

  /**
   * The status of the redirect, either `pending` (ready to be used by your customer to
   * authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or
   * `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be
   * reused).
   */
  @optional
  Nullable!(string) status;

  /**
   * The URL provided to you to redirect a customer to as part of a `redirect` authentication
   * flow.
   */
  @optional
  Nullable!(string) url;

}
