// File automatically generated from OpenAPI spec.
module stripe.model.payment_flows_amount_details_resource_tip;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentFlowsAmountDetailsResourceTip {
  /**
   * Portion of the amount that corresponds to a tip.
   */
  @optional
  Nullable!(int) amount;

}
