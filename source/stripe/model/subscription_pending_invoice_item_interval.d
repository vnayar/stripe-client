// File automatically generated from OpenAPI spec.
module stripe.model.subscription_pending_invoice_item_interval;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SubscriptionPendingInvoiceItemInterval {
  /**
   * The number of intervals between invoices. For example, `interval=month` and
   * `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12
   * months, or 52 weeks).
   */
  @optional
  Nullable!(int) interval_count;

  /**
   * Specifies invoicing frequency. Either `day`, `week`, `month` or `year`.
   */
  @optional
  string interval;

  mixin AddBuilder!(typeof(this));

}
