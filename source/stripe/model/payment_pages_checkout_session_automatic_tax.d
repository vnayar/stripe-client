// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionAutomaticTax {
  /**
   * Indicates whether automatic tax is enabled for the session
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * The status of the most recent automated tax calculation for this session.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}
