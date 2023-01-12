// File automatically generated from OpenAPI spec.
module stripe.model.payment_flows_installment_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_method_details_card_installments_plan : PaymentMethodDetailsCardInstallmentsPlan;

/**
 */
class PaymentFlowsInstallmentOptions {
  @optional
  Nullable!(bool) enabled;

  @optional
  PaymentMethodDetailsCardInstallmentsPlan plan;

  mixin AddBuilder!(typeof(this));

}
