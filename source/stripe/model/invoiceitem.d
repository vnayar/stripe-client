// File automatically generated from OpenAPI spec.
module stripe.model.invoiceitem;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.discount : Discount;
import stripe.model.invoice : Invoice;
import stripe.model.invoice_line_item_period : InvoiceLineItemPeriod;
import stripe.model.price : Price;
import stripe.model.subscription : Subscription;
import stripe.model.tax_rate : TaxRate;
import stripe.model.test_helpers.test_clock : TestHelpersTestClock;

/**
 * Sometimes you want to add a charge or credit to a customer, but actually
 * charge or credit the customer's card only at the end of a regular billing
 * cycle. This is useful for combining several charges (to minimize
 * per-transaction fees), or for having Stripe tabulate your usage-based billing
 * totals.
 * Related guide: [Subscription
 * Invoices](https://stripe.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).
 */
class Invoiceitem {
  /**
   * Amount (in the `currency` specified) of the invoice item. This should always be equal to
   * `unit_amount * quantity`.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The ID of the invoice this invoice item belongs to.
   */
  @optional
  Json invoice;

  /**
   * Whether the invoice item was created automatically as a proration adjustment when the
   * customer switched plans.
   */
  @optional
  Nullable!(bool) proration;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The subscription that this invoice item has been created for, if any.
   */
  @optional
  Json subscription;

  /**
   * Unit amount (in the `currency` specified) of the invoice item.
   */
  @optional
  Nullable!(int) unit_amount;

  /**
   * The ID of the customer who will be billed when this invoice item is billed.
   */
  @optional
  Json customer;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * The subscription item that this invoice item has been created for, if any.
   */
  @optional
  Nullable!(string) subscription_item;

  @optional
  InvoiceLineItemPeriod period;

  /**
   * Quantity of units for the invoice item. If the invoice item is a proration, the quantity of
   * the subscription that the proration was computed for.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
   */
  @optional
  Nullable!(string) unit_amount_decimal;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) date;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * ID of the test clock this invoice item belongs to.
   */
  @optional
  Json test_clock;

  /**
   * If true, discounts will apply to this invoice item. Always false for prorations.
   */
  @optional
  Nullable!(bool) discountable;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

  /**
   * The discounts which apply to the invoice item. Item discounts are applied before invoice
   * discounts. Use `expand[]=discounts` to expand each discount.
   */
  @optional
  Json[] discounts;

  /**
   * The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the
   * invoice do not apply to this invoice item.
   */
  @optional
  TaxRate[] tax_rates;

  /**
   * The price of the invoice item.
   */
  @optional
  Price price;

}
