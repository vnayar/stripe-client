// File automatically generated from OpenAPI spec.
module stripe.model.billing_portal.session;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.billing_portal.configuration : BillingPortalConfiguration;
import stripe.model.portal_flows_flow : PortalFlowsFlow;

/**
 * The Billing customer portal is a Stripe-hosted UI for subscription and
 * billing management.
 * A portal configuration describes the functionality and features that you
 * want to provide to your customers through the portal.
 * A portal session describes the instantiation of the customer portal for
 * a particular customer. By visiting the session's URL, the customer
 * can manage their subscriptions and billing details. For security reasons,
 * sessions are short-lived and will expire if the customer does not visit the URL.
 * Create sessions on-demand when customers intend to manage their subscriptions
 * and billing details.
 * Learn more in the [integration
 * guide](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal).
 */
class BillingPortalSession {
  /**
   * The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the
   * customer’s `preferred_locales` or browser’s locale is used.
   */
  @optional
  string locale;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The URL to redirect customers to when they click on the portal's link to return to your
   * website.
   */
  @optional
  string return_url;

  /**
   * The configuration used by this session, describing the features available.
   */
  @optional
  Json configuration;

  /**
   * The ID of the customer for this session.
   */
  @optional
  string customer;

  /**
   * The short-lived URL of the session that gives customers access to the customer portal.
   */
  @optional
  string url;

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
  string object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Information about a specific flow for the customer to go through.
   */
  @optional
  PortalFlowsFlow flow;

  /**
   * The account for which the session was created on behalf of. When specified, only
   * subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more
   * information, see the [docs](https://stripe.com/docs/connect/charges-transfers#on-behalf-of).
   * Use the [Accounts
   * API](https://stripe.com/docs/api/accounts/object#account_object-settings-branding) to modify
   * the `on_behalf_of` account's branding settings, which the portal displays.
   */
  @optional
  string on_behalf_of;

  mixin AddBuilder!(typeof(this));

}
