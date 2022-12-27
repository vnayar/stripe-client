// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_verification_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationVerificationData {
  /**
   * Whether the cardholder provided a CVC and if it matched Stripe’s record.
   */
  @optional
  Nullable!(string) cvc_check;

  /**
   * Whether the cardholder provided an address first line and if it matched the cardholder’s
   * `billing.address.line1`.
   */
  @optional
  Nullable!(string) address_line1_check;

  /**
   * Whether the cardholder provided a postal code and if it matched the cardholder’s
   * `billing.address.postal_code`.
   */
  @optional
  Nullable!(string) address_postal_code_check;

  /**
   * Whether the cardholder provided an expiry date and if it matched Stripe’s record.
   */
  @optional
  Nullable!(string) expiry_check;

}
