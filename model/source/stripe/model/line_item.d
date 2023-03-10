// File automatically generated from OpenAPI spec.
module stripe.model.line_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.discount : Discount;
import stripe.model.discounts_resource_discount_amount : DiscountsResourceDiscountAmount;
import stripe.model.invoice_line_item_period : InvoiceLineItemPeriod;
import stripe.model.invoice_tax_amount : InvoiceTaxAmount;
import stripe.model.invoices_line_items_proration_details : InvoicesLineItemsProrationDetails;
import stripe.model.price : Price;
import stripe.model.tax_rate : TaxRate;

/**
 */
class LineItem {
  /**
   * The ID of the [invoice item](https://stripe.com/docs/api/invoiceitems) associated with this
   * line item if any.
   */
  @optional
  string invoice_item;

  /**
   * The amount, in %s.
   */
  @optional
  Nullable!(int) amount;

  @optional
  InvoiceLineItemPeriod period;

  /**
   * Whether this is a proration.
   */
  @optional
  Nullable!(bool) proration;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The subscription that the invoice item pertains to, if any.
   */
  @optional
  string subscription;

  /**
   * The integer amount in %s representing the amount for this line item, excluding all tax and
   * discounts.
   */
  @optional
  Nullable!(int) amount_excluding_tax;

  /**
   * The amount of discount calculated per discount for this line item.
   */
  @optional
  DiscountsResourceDiscountAmount[] discount_amounts;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format. Note that for line items with `type=subscription` this will reflect the
   * metadata of the subscription that caused the line item to be created.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Additional details for proration line items
   */
  @optional
  InvoicesLineItemsProrationDetails proration_details;

  /**
   * The quantity of the subscription, if the line item is a subscription or a proration.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * The subscription item that generated this invoice item. Left empty if the line item is not an
   * explicit result of a subscription.
   */
  @optional
  string subscription_item;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The amount of tax calculated per tax rate for this line item
   */
  @optional
  InvoiceTaxAmount[] tax_amounts;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * If true, discounts will apply to this line item. Always false for prorations.
   */
  @optional
  Nullable!(bool) discountable;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  /**
   * A string identifying the type of the source of this line item, either an `invoiceitem` or a
   * `subscription`.
   */
  @optional
  string type;

  /**
   * The discounts applied to the invoice line item. Line item discounts are applied before
   * invoice discounts. Use `expand[]=discounts` to expand each discount.
   */
  @optional
  Json[] discounts;

  /**
   * The tax rates which apply to the line item.
   */
  @optional
  TaxRate[] tax_rates;

  /**
   * The price of the line item.
   */
  @optional
  Price price;

  /**
   * The amount in %s representing the unit amount for this line item, excluding all tax and
   * discounts.
   */
  @optional
  string unit_amount_excluding_tax;

  mixin AddBuilder!(typeof(this));

}
