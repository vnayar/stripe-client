// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_shipping_address_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionShippingAddressCollection {
  /**
   * An array of two-letter ISO country codes representing which countries Checkout should provide
   * as options for
   * shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP,
   * PW, SD, SY, UM, VI`.
   */
  @optional
  Nullable!(string)[] allowed_countries;

}
