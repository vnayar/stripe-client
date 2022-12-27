// File automatically generated from OpenAPI spec.
module stripe.model.checkout_card_installments_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CheckoutCardInstallmentsOptions {
  /**
   * Indicates if installments are enabled
   */
  @optional
  Nullable!(bool) enabled;

}
