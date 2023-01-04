// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_pix;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsPix {
  /**
   * Unique transaction id generated by BCB
   */
  @optional
  string bank_transaction_id;

}
