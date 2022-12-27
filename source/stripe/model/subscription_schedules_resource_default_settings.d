// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedules_resource_default_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.invoice_setting_subscription_schedule_setting : InvoiceSettingSubscriptionScheduleSetting;
import stripe.model.payment_method : PaymentMethod;
import stripe.model.subscription_billing_thresholds : SubscriptionBillingThresholds;
import stripe.model.subscription_schedules_resource_default_settings_automatic_tax : SubscriptionSchedulesResourceDefaultSettingsAutomaticTax;
import stripe.model.subscription_transfer_data : SubscriptionTransferData;

/**
 */
class SubscriptionSchedulesResourceDefaultSettings {
  /**
   * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
   * attempt to pay the underlying subscription at the end of each billing cycle using the default
   * source attached to the customer. When sending an invoice, Stripe will email your customer an
   * invoice with payment instructions and mark the subscription as `active`.
   */
  @optional
  Nullable!(string) collection_method;

  /**
   * The subscription schedule's default invoice settings.
   */
  @optional
  InvoiceSettingSubscriptionScheduleSetting invoice_settings;

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
   * ID of the default payment method for the subscription schedule. If not set, invoices will use
   * the default payment method in the customer's invoice settings.
   */
  @optional
  Json default_payment_method;

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
  SubscriptionSchedulesResourceDefaultSettingsAutomaticTax automatic_tax;

}
