// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedule_phase_configuration;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.coupon : Coupon;
import stripe.model.deleted_coupon : DeletedCoupon;
import stripe.model.invoice_setting_subscription_schedule_setting : InvoiceSettingSubscriptionScheduleSetting;
import stripe.model.payment_method : PaymentMethod;
import stripe.model.schedules_phase_automatic_tax : SchedulesPhaseAutomaticTax;
import stripe.model.subscription_billing_thresholds : SubscriptionBillingThresholds;
import stripe.model.subscription_schedule_add_invoice_item : SubscriptionScheduleAddInvoiceItem;
import stripe.model.subscription_schedule_configuration_item : SubscriptionScheduleConfigurationItem;
import stripe.model.subscription_transfer_data : SubscriptionTransferData;
import stripe.model.tax_rate : TaxRate;

/**
 * A phase describes the plans, coupon, and trialing status of a subscription for a predefined
 * time period.
 */
class SubscriptionSchedulePhaseConfiguration {
  /**
   * If the subscription schedule will prorate when transitioning to this phase. Possible values
   * are `create_prorations` and `none`.
   */
  @optional
  Nullable!(string) proration_behavior;

  /**
   * The start of this phase of the subscription schedule.
   */
  @optional
  Nullable!(long) start_date;

  /**
   * ID of the coupon to use during this phase of the subscription schedule.
   */
  @optional
  Json coupon;

  /**
   * Subscription items to configure the subscription to during this phase of the subscription
   * schedule.
   */
  @optional
  SubscriptionScheduleConfigurationItem[] items;

  /**
   * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
   * attempt to pay the underlying subscription at the end of each billing cycle using the default
   * source attached to the customer. When sending an invoice, Stripe will email your customer an
   * invoice with payment instructions and mark the subscription as `active`.
   */
  @optional
  Nullable!(string) collection_method;

  /**
   * The invoice settings applicable during this phase.
   */
  @optional
  InvoiceSettingSubscriptionScheduleSetting invoice_settings;

  /**
   * The end of this phase of the subscription schedule.
   */
  @optional
  Nullable!(long) end_date;

  /**
   * Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor
   * of the subscription is set to the start of the phase when entering the phase. If `automatic`
   * then the billing cycle anchor is automatically modified as needed when entering the phase.
   * For more information, see the billing cycle
   * [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
   */
  @optional
  Nullable!(string) billing_cycle_anchor;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * The default tax rates to apply to the subscription during this phase of the subscription
   * schedule.
   */
  @optional
  TaxRate[] default_tax_rates;

  /**
   * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
   * the percentage of the subscription invoice subtotal that will be transferred to the
   * application owner's Stripe account during this phase of the schedule.
   */
  @optional
  Nullable!(float) application_fee_percent;

  /**
   * Define thresholds at which an invoice will be sent, and the subscription advanced to a new
   * billing period
   */
  @optional
  SubscriptionBillingThresholds billing_thresholds;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to a
   * phase. Metadata on a schedule's phase will update the underlying subscription's `metadata`
   * when the phase is entered. Updating the underlying subscription's `metadata` directly will
   * not affect the current phase's `metadata`.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * ID of the default payment method for the subscription schedule. It must belong to the
   * customer associated with the subscription schedule. If not set, invoices will use the default
   * payment method in the customer's invoice settings.
   */
  @optional
  Json default_payment_method;

  /**
   * A list of prices and quantities that will generate invoice items appended to the next invoice
   * for this phase.
   */
  @optional
  SubscriptionScheduleAddInvoiceItem[] add_invoice_items;

  /**
   * Subscription description, meant to be displayable to the customer. Use this field to
   * optionally store an explanation of the subscription.
   */
  @optional
  Nullable!(string) description;

  /**
   * The account (if any) the associated subscription's payments will be attributed to for tax
   * reporting, and where funds from each payment will be transferred to for each of the
   * subscription's invoices.
   */
  @optional
  SubscriptionTransferData transfer_data;

  /**
   * The account (if any) the charge was made on behalf of for charges associated with the
   * schedule's subscription. See the Connect documentation for details.
   */
  @optional
  Json on_behalf_of;

  @optional
  SchedulesPhaseAutomaticTax automatic_tax;

  /**
   * When the trial ends within the phase.
   */
  @optional
  Nullable!(long) trial_end;

}
