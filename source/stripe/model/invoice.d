// File automatically generated from OpenAPI spec.
module stripe.model.invoice;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.address : Address;
import stripe.model.api_errors : ApiErrors;
import stripe.model.application : Application;
import stripe.model.automatic_tax : AutomaticTax;
import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;
import stripe.model.charge : Charge;
import stripe.model.customer : Customer;
import stripe.model.deleted_application : DeletedApplication;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.deleted_discount : DeletedDiscount;
import stripe.model.deleted_tax_id : DeletedTaxId;
import stripe.model.discount : Discount;
import stripe.model.discounts_resource_discount_amount : DiscountsResourceDiscountAmount;
import stripe.model.invoice_setting_custom_field : InvoiceSettingCustomField;
import stripe.model.invoice_setting_rendering_options : InvoiceSettingRenderingOptions;
import stripe.model.invoice_tax_amount : InvoiceTaxAmount;
import stripe.model.invoice_threshold_reason : InvoiceThresholdReason;
import stripe.model.invoice_transfer_data : InvoiceTransferData;
import stripe.model.invoices_from_invoice : InvoicesFromInvoice;
import stripe.model.invoices_payment_settings : InvoicesPaymentSettings;
import stripe.model.invoices_resource_invoice_tax_id : InvoicesResourceInvoiceTaxId;
import stripe.model.invoices_status_transitions : InvoicesStatusTransitions;
import stripe.model.line_item : LineItem;
import stripe.model.payment_intent : PaymentIntent;
import stripe.model.payment_method : PaymentMethod;
import stripe.model.quote : Quote;
import stripe.model.shipping : Shipping;
import stripe.model.source : Source;
import stripe.model.subscription : Subscription;
import stripe.model.tax_id : TaxId;
import stripe.model.tax_rate : TaxRate;
import stripe.model.test_helpers.test_clock : TestHelpersTestClock;

/**
 * Invoices are statements of amounts owed by a customer, and are either
 * generated one-off, or generated periodically from a subscription.
 * They contain [invoice items](https://stripe.com/docs/api#invoiceitems), and proration
 * adjustments
 * that may be caused by subscription upgrades/downgrades (if necessary).
 * If your invoice is configured to be billed through automatic charges,
 * Stripe automatically finalizes your invoice and attempts payment. Note
 * that finalizing the invoice,
 * [when automatic](https://stripe.com/docs/billing/invoices/workflow/#auto_advance), does
 * not happen immediately as the invoice is created. Stripe waits
 * until one hour after the last webhook was successfully sent (or the last
 * webhook timed out after failing). If you (and the platforms you may have
 * connected to) have no webhooks configured, Stripe waits one hour after
 * creation to finalize the invoice.
 * If your invoice is configured to be billed by sending an email, then based on your
 * [email settings](https://dashboard.stripe.com/account/billing/automatic),
 * Stripe will email the invoice to your customer and await payment. These
 * emails can contain a link to a hosted page to pay the invoice.
 * Stripe applies any customer credit on the account before determining the
 * amount due for the invoice (i.e., the amount that will be actually
 * charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
 * per currency](/docs/currencies#minimum-and-maximum-charge-amounts), the
 * invoice is automatically marked paid, and we add the amount due to the
 * customer's credit balance which is applied to the next invoice.
 * More details on the customer's credit balance are
 * [here](https://stripe.com/docs/billing/customer/balance).
 * Related guide: [Send Invoices to Customers](https://stripe.com/docs/billing/invoices/sending).
 */
class Invoice {
  /**
   * The date on which payment for this invoice is due. This value will be `null` for invoices
   * where `collection_method=charge_automatically`.
   */
  @optional
  Nullable!(long) due_date;

  /**
   * Returns true if the invoice was manually marked paid, returns false if the invoice hasn't
   * been paid yet or was paid on Stripe.
   */
  @optional
  Nullable!(bool) paid_out_of_band;

  /**
   * Unique identifier for the object. This property is always present unless the invoice is an
   * upcoming invoice. See [Retrieve an upcoming
   * invoice](https://stripe.com/docs/api/invoices/upcoming) for more details.
   */
  @optional
  Nullable!(string) id;

  /**
   * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
   * attempt to pay this invoice using the default source attached to the customer. When sending
   * an invoice, Stripe will email this invoice to the customer with payment instructions.
   */
  @optional
  Nullable!(string) collection_method;

  /**
   * The tax rates applied to this invoice, if any.
   */
  @optional
  TaxRate[] default_tax_rates;

  /**
   * The URL for the hosted invoice page, which allows customers to view and pay an invoice. If
   * the invoice has not been finalized yet, this will be null.
   */
  @optional
  Nullable!(string) hosted_invoice_url;

  /**
   * The difference between amount_due and amount_paid, in %s.
   */
  @optional
  Nullable!(int) amount_remaining;

  @optional
  InvoiceThresholdReason threshold_reason;

  /**
   * Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour
   * after the `invoice.created` webhook, for example, so you might not want to display that
   * invoice as unpaid to your users.
   */
  @optional
  Nullable!(bool) attempted;

  /**
   * Total of all subscriptions, invoice items, and prorations on the invoice before any invoice
   * level discount or exclusive tax is applied. Item discounts are already incorporated
   */
  @optional
  Nullable!(int) subtotal;

  /**
   * The customer's shipping information. Until the invoice is finalized, this field will equal
   * `customer.shipping`. Once the invoice is finalized, this field will no longer be updated.
   */
  @optional
  Shipping customer_shipping;

  /**
   * The customer's phone number. Until the invoice is finalized, this field will equal
   * `customer.phone`. Once the invoice is finalized, this field will no longer be updated.
   */
  @optional
  Nullable!(string) customer_phone;

  /**
   * Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all
   * webhook delivery attempts have [been
   * exhausted](https://stripe.com/docs/billing/webhooks#understand). This field tracks the time
   * when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to
   * deliver, this will be set while the invoice is being created.
   */
  @optional
  Nullable!(long) webhooks_delivered_at;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The account (if any) for which the funds of the invoice payment are intended. If set, the
   * invoice will be presented with the branding and support information of the specified account.
   * See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect)
   * documentation for details.
   */
  @optional
  Json on_behalf_of;

  /**
   * End of the usage period during which invoice items were added to this invoice.
   */
  @optional
  Nullable!(long) period_end;

  /**
   * The ID of the most recent non-draft revision of this invoice
   */
  @optional
  Json latest_revision;

  /**
   * A unique, identifying string that appears on emails sent to the customer for this invoice.
   * This starts with the customer's unique invoice_prefix if it is specified.
   */
  @optional
  Nullable!(string) number;

  /**
   * The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.
   */
  @optional
  Nullable!(int) tax;

  /**
   * The subscription that this invoice was prepared for, if any.
   */
  @optional
  Json subscription;

  static class InvoiceLinesList {
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
    Nullable!(string) object;

    /**
     * Details about each object.
     */
    @optional
    LineItem[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * The individual line items that make up the invoice. `lines` is sorted as follows: invoice
   * items in reverse chronological order, followed by the subscription, if any.
   */
  @optional
  InvoiceLinesList lines;

  /**
   * The ID of the customer who will be billed.
   */
  @optional
  Json customer;

  /**
   * Ending customer balance after the invoice is finalized. Invoices are finalized approximately
   * an hour after successful webhook delivery or when payment collection is attempted for the
   * invoice. If the invoice has not been finalized yet, this will be null.
   */
  @optional
  Nullable!(int) ending_balance;

  /**
   * The link to download the PDF for the invoice. If the invoice has not been finalized yet, this
   * will be null.
   */
  @optional
  Nullable!(string) invoice_pdf;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * Details of the invoice that was cloned. See the [revision
   * documentation](https://stripe.com/docs/invoicing/invoice-revisions) for more details.
   */
  @optional
  InvoicesFromInvoice from_invoice;

  /**
   * Total amount of all pre-payment credit notes issued for this invoice.
   */
  @optional
  Nullable!(int) pre_payment_credit_notes_amount;

  /**
   * ID of the latest charge generated for this invoice, if any.
   */
  @optional
  Json charge;

  /**
   * The customer's tax exempt status. Until the invoice is finalized, this field will equal
   * `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated.
   */
  @optional
  Nullable!(string) customer_tax_exempt;

  /**
   * Whether payment was successfully collected for this invoice. An invoice can be paid (most
   * commonly) with a charge or with credit from the customer's account balance.
   */
  @optional
  Nullable!(bool) paid;

  /**
   * Custom fields displayed on the invoice.
   */
  @optional
  InvoiceSettingCustomField[] custom_fields;

  /**
   * ID of the default payment method for the invoice. It must belong to the customer associated
   * with the invoice. If not set, defaults to the subscription's default payment method, if any,
   * or to the default payment method in the customer's invoice settings.
   */
  @optional
  Json default_payment_method;

  @optional
  InvoicesPaymentSettings payment_settings;

  /**
   * The account (if any) the payment will be attributed to for tax reporting, and where funds
   * from the payment will be transferred to for the invoice.
   */
  @optional
  InvoiceTransferData transfer_data;

  /**
   * Only set for upcoming invoices that preview prorations. The time used to calculate
   * prorations.
   */
  @optional
  Nullable!(int) subscription_proration_date;

  /**
   * The customer's address. Until the invoice is finalized, this field will equal
   * `customer.address`. Once the invoice is finalized, this field will no longer be updated.
   */
  @optional
  Address customer_address;

  /**
   * The quote this invoice was generated from.
   */
  @optional
  Json quote;

  /**
   * The time at which payment will next be attempted. This value will be `null` for invoices
   * where `collection_method=send_invoice`.
   */
  @optional
  Nullable!(long) next_payment_attempt;

  /**
   * Number of payment attempts made for this invoice, from the perspective of the payment retry
   * schedule. Any payment attempt counts as the first attempt, and subsequently only automatic
   * retries increment the attempt count. In other words, manual payment attempts after the first
   * attempt do not affect the retry schedule.
   */
  @optional
  Nullable!(int) attempt_count;

  /**
   * Total amount of all post-payment credit notes issued for this invoice.
   */
  @optional
  Nullable!(int) post_payment_credit_notes_amount;

  /**
   * The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax
   * IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be
   * updated.
   */
  @optional
  InvoicesResourceInvoiceTaxId[] customer_tax_ids;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
   */
  @optional
  Json[] account_tax_ids;

  /**
   * The integer amount in %s representing the subtotal of the invoice before any invoice level
   * discount or tax is applied. Item discounts are already incorporated
   */
  @optional
  Nullable!(int) subtotal_excluding_tax;

  /**
   * This is the transaction number that appears on email receipts sent for this invoice.
   */
  @optional
  Nullable!(string) receipt_number;

  /**
   * The amount, in %s, that was paid.
   */
  @optional
  Nullable!(int) amount_paid;

  /**
   * ID of the Connect Application that created the invoice.
   */
  @optional
  Json application;

  /**
   * The integer amount in %s representing the total amount of the invoice including all discounts
   * but excluding all tax.
   */
  @optional
  Nullable!(int) total_excluding_tax;

  /**
   * The country of the business associated with this invoice, most often the business creating
   * the invoice.
   */
  @optional
  Nullable!(string) account_country;

  /**
   * Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice
   * created by a subscription advancing into a new period. `subscription_create` indicates an
   * invoice created due to creating a subscription. `subscription_update` indicates an invoice
   * created due to updating a subscription. `subscription` is set for all old invoices to
   * indicate either a change to a subscription or a period advancement. `manual` is set for all
   * invoices unrelated to a subscription (for example: created via the invoice editor). The
   * `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint.
   * `subscription_threshold` indicates an invoice created due to a billing threshold being
   * reached.
   */
  @optional
  Nullable!(string) billing_reason;

  /**
   * The error encountered during the previous attempt to finalize the invoice. This field is
   * cleared when the invoice is successfully finalized.
   */
  @optional
  ApiErrors last_finalization_error;

  /**
   * Final amount due at this time for this invoice. If the invoice's total is smaller than the
   * minimum charge amount, for example, or if there is account credit that can be applied to the
   * invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice
   * (the customer owes money), the `amount_due` will also take that into account. The charge that
   * gets generated for the invoice will be for the amount specified in `amount_due`.
   */
  @optional
  Nullable!(int) amount_due;

  /**
   * Controls whether Stripe will perform [automatic
   * collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice.
   * When `false`, the invoice's state will not automatically advance without an explicit action.
   */
  @optional
  Nullable!(bool) auto_advance;

  /**
   * The fee in %s that will be applied to the invoice and transferred to the application owner's
   * Stripe account when the invoice is paid.
   */
  @optional
  Nullable!(int) application_fee_amount;

  /**
   * ID of the test clock this invoice belongs to.
   */
  @optional
  Json test_clock;

  /**
   * ID of the default payment source for the invoice. It must belong to the customer associated
   * with the invoice and be in a chargeable state. If not set, defaults to the subscription's
   * default source, if any, or to the customer's default source.
   */
  @optional
  Json default_source;

  /**
   * Describes the current discount applied to this invoice, if there is one. Not populated if
   * there are multiple discounts.
   */
  @optional
  Discount discount;

  /**
   * Start of the usage period during which invoice items were added to this invoice.
   */
  @optional
  Nullable!(long) period_start;

  /**
   * The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn
   * more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
   */
  @optional
  Nullable!(string) status;

  /**
   * Extra information about an invoice for the customer's credit card statement.
   */
  @optional
  Nullable!(string) statement_descriptor;

  /**
   * The customer's name. Until the invoice is finalized, this field will equal `customer.name`.
   * Once the invoice is finalized, this field will no longer be updated.
   */
  @optional
  Nullable!(string) customer_name;

  /**
   * The PaymentIntent associated with this invoice. The PaymentIntent is generated when the
   * invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice
   * will cancel the PaymentIntent.
   */
  @optional
  Json payment_intent;

  @optional
  InvoicesStatusTransitions status_transitions;

  /**
   * The aggregate amounts calculated per discount across all line items.
   */
  @optional
  DiscountsResourceDiscountAmount[] total_discount_amounts;

  /**
   * The public name of the business associated with this invoice, most often the business
   * creating the invoice.
   */
  @optional
  Nullable!(string) account_name;

  /**
   * Total after discounts and taxes.
   */
  @optional
  Nullable!(int) total;

  /**
   * The customer's email. Until the invoice is finalized, this field will equal `customer.email`.
   * Once the invoice is finalized, this field will no longer be updated.
   */
  @optional
  Nullable!(string) customer_email;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Footer displayed on the invoice.
   */
  @optional
  Nullable!(string) footer;

  /**
   * The discounts applied to the invoice. Line item discounts are applied before invoice
   * discounts. Use `expand[]=discounts` to expand each discount.
   */
  @optional
  Json[] discounts;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users. Referenced
   * as 'memo' in the Dashboard.
   */
  @optional
  Nullable!(string) description;

  /**
   * Options for invoice PDF rendering.
   */
  @optional
  InvoiceSettingRenderingOptions rendering_options;

  /**
   * Starting customer balance before the invoice is finalized. If the invoice has not been
   * finalized yet, this will be the current customer balance. For revision invoices, this also
   * includes any customer balance that was applied to the original invoice.
   */
  @optional
  Nullable!(int) starting_balance;

  @optional
  AutomaticTax automatic_tax;

  /**
   * The aggregate amounts calculated per tax rate for all line items.
   */
  @optional
  InvoiceTaxAmount[] total_tax_amounts;

}
