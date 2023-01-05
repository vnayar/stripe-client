// File automatically generated from OpenAPI spec.
module stripe.model.invoice_threshold_reason;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice_item_threshold_reason : InvoiceItemThresholdReason;

/**
 */
class InvoiceThresholdReason {
  /**
   * Indicates which line items triggered a threshold invoice.
   */
  @optional
  InvoiceItemThresholdReason[] item_reasons;

  /**
   * The total invoice amount threshold boundary if it triggered the threshold invoice.
   */
  @optional
  Nullable!(int) amount_gte;

  mixin AddBuilder!(typeof(this));

}
