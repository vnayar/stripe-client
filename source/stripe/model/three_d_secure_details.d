// File automatically generated from OpenAPI spec.
module stripe.model.three_d_secure_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class ThreeDSecureDetails {
  /**
   * The version of 3D Secure that was used.
   */
  @optional
  string version_;

  /**
   * Additional information about why 3D Secure succeeded or failed based
   * on the `result`.
   */
  @optional
  string result_reason;

  /**
   * Indicates the outcome of 3D Secure authentication.
   */
  @optional
  string result;

  /**
   * For authenticated transactions: how the customer was authenticated by
   * the issuing bank.
   */
  @optional
  string authentication_flow;

}
