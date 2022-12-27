// File automatically generated from OpenAPI spec.
module stripe.model.payment_flows_amount_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_flows_amount_details_resource_tip : PaymentFlowsAmountDetailsResourceTip;

/**
 */
class PaymentFlowsAmountDetails {
  @optional
  PaymentFlowsAmountDetailsResourceTip tip;

}
