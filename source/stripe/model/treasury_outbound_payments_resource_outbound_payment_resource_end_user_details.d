// File automatically generated from OpenAPI spec.
module stripe.model.treasury_outbound_payments_resource_outbound_payment_resource_end_user_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryOutboundPaymentsResourceOutboundPaymentResourceEndUserDetails {
  /**
   * `true`` if the OutboundPayment creation request is being made on behalf of an end user by a
   * platform. Otherwise, `false`.
   */
  @optional
  Nullable!(bool) present;

  /**
   * IP address of the user initiating the OutboundPayment. Set if `present` is set to `true`. IP
   * address collection is required for risk and compliance reasons. This will be used to help
   * determine if the OutboundPayment is authorized or should be blocked.
   */
  @optional
  Nullable!(string) ip_address;

}
