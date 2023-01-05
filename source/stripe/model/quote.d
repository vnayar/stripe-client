// File automatically generated from OpenAPI spec.
module stripe.model.quote;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.application : Application;
import stripe.model.customer : Customer;
import stripe.model.deleted_application : DeletedApplication;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.deleted_invoice : DeletedInvoice;
import stripe.model.discount : Discount;
import stripe.model.invoice : Invoice;
import stripe.model.invoice_setting_quote_setting : InvoiceSettingQuoteSetting;
import stripe.model.item : Item;
import stripe.model.quotes_resource_automatic_tax : QuotesResourceAutomaticTax;
import stripe.model.quotes_resource_computed : QuotesResourceComputed;
import stripe.model.quotes_resource_from_quote : QuotesResourceFromQuote;
import stripe.model.quotes_resource_status_transitions : QuotesResourceStatusTransitions;
import stripe.model.quotes_resource_subscription_data_subscription_data : QuotesResourceSubscriptionDataSubscriptionData;
import stripe.model.quotes_resource_total_details : QuotesResourceTotalDetails;
import stripe.model.quotes_resource_transfer_data : QuotesResourceTransferData;
import stripe.model.subscription : Subscription;
import stripe.model.subscription_schedule : SubscriptionSchedule;
import stripe.model.tax_rate : TaxRate;
import stripe.model.test_helpers.test_clock : TestHelpersTestClock;

/**
 * A Quote is a way to model prices that you'd like to provide to a customer.
 * Once accepted, it will automatically create an invoice, subscription or subscription schedule.
 */
class Quote {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
   * attempt to pay invoices at the end of the subscription cycle or on finalization using the
   * default payment method attached to the subscription or customer. When sending an invoice,
   * Stripe will email your customer an invoice with payment instructions and mark the
   * subscription as `active`. Defaults to `charge_automatically`.
   */
  @optional
  string collection_method;

  /**
   * Total after discounts and taxes are applied.
   */
  @optional
  Nullable!(int) amount_total;

  /**
   * The tax rates applied to this quote.
   */
  @optional
  Json[] default_tax_rates;

  @optional
  QuotesResourceComputed computed;

  /**
   * A header that will be displayed on the quote PDF.
   */
  @optional
  string header;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The account on behalf of which to charge. See the [Connect
   * documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-a
   * ccounts) for details.
   */
  @optional
  Json on_behalf_of;

  /**
   * The invoice that was created from this quote.
   */
  @optional
  Json invoice;

  /**
   * Details of the quote that was cloned. See the [cloning
   * documentation](https://stripe.com/docs/quotes/clone) for more details.
   */
  @optional
  QuotesResourceFromQuote from_quote;

  /**
   * A unique number that identifies this particular quote. This number is assigned once the quote
   * is [finalized](https://stripe.com/docs/quotes/overview#finalize).
   */
  @optional
  string number;

  /**
   * The subscription that was created or updated from this quote.
   */
  @optional
  Json subscription;

  /**
   * The customer which this quote belongs to. A customer is required before finalizing the quote.
   * Once specified, it cannot be changed.
   */
  @optional
  Json customer;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The subscription schedule that was created or updated from this quote.
   */
  @optional
  Json subscription_schedule;

  /**
   * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
   * the percentage of the subscription invoice subtotal that will be transferred to the
   * application owner's Stripe account. Only applicable if there are line items with recurring
   * prices on the quote.
   */
  @optional
  Nullable!(float) application_fee_percent;

  /**
   * The account (if any) the payments will be attributed to for tax reporting, and where funds
   * from each payment will be transferred to for each of the invoices.
   */
  @optional
  QuotesResourceTransferData transfer_data;

  /**
   * The date on which the quote will be canceled if in `open` or `draft` status. Measured in
   * seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  static class QuotesResourceListLineItems {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    string object;

    /**
     * Details about each object.
     */
    @optional
    Item[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

    mixin AddBuilder!(typeof(this));

  }

  /**
   * A list of items the customer is being quoted for.
   */
  @optional
  QuotesResourceListLineItems line_items;

  /**
   * ID of the Connect Application that created the quote.
   */
  @optional
  Json application;

  /**
   * ID of the test clock this quote belongs to.
   */
  @optional
  Json test_clock;

  @optional
  QuotesResourceSubscriptionDataSubscriptionData subscription_data;

  /**
   * The amount of the application fee (if any) that will be requested to be applied to the
   * payment and transferred to the application owner's Stripe account. Only applicable if there
   * are no line items with recurring prices on the quote.
   */
  @optional
  Nullable!(int) application_fee_amount;

  /**
   * The status of the quote.
   */
  @optional
  string status;

  @optional
  QuotesResourceTotalDetails total_details;

  @optional
  QuotesResourceStatusTransitions status_transitions;

  /**
   * All invoices will be billed using the specified settings.
   */
  @optional
  InvoiceSettingQuoteSetting invoice_settings;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Total before any discounts or taxes are applied.
   */
  @optional
  Nullable!(int) amount_subtotal;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * A footer that will be displayed on the quote PDF.
   */
  @optional
  string footer;

  /**
   * The discounts applied to this quote.
   */
  @optional
  Json[] discounts;

  /**
   * A description that will be displayed on the quote PDF.
   */
  @optional
  string description;

  @optional
  QuotesResourceAutomaticTax automatic_tax;

  mixin AddBuilder!(typeof(this));

}
