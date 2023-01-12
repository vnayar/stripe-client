// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_verification_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationVerificationData {
  /**
   * Whether the cardholder provided a CVC and if it matched Stripe’s record.
   */
  @optional
  string cvc_check;

  /**
   * Whether the cardholder provided an address first line and if it matched the cardholder’s
   * `billing.address.line1`.
   */
  @optional
  string address_line1_check;

  /**
   * Whether the cardholder provided a postal code and if it matched the cardholder’s
   * `billing.address.postal_code`.
   */
  @optional
  string address_postal_code_check;

  /**
   * Whether the cardholder provided an expiry date and if it matched Stripe’s record.
   */
  @optional
  string expiry_check;

  mixin AddBuilder!(typeof(this));

}
