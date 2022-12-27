// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedule_add_invoice_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.deleted_price : DeletedPrice;
import stripe.model.price : Price;
import stripe.model.tax_rate : TaxRate;

/**
 * An Add Invoice Item describes the prices and quantities that will be added as pending invoice
 * items when entering a phase.
 */
class SubscriptionScheduleAddInvoiceItem {
  /**
   * The quantity of the invoice item.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this
   * item.
   */
  @optional
  TaxRate[] tax_rates;

  /**
   * ID of the price used to generate the invoice item.
   */
  @optional
  Json price;

}
