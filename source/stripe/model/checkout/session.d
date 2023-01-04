// File automatically generated from OpenAPI spec.
module stripe.model.checkout.session;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.checkout_session_payment_method_options : CheckoutSessionPaymentMethodOptions;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.invoice : Invoice;
import stripe.model.item : Item;
import stripe.model.payment_intent : PaymentIntent;
import stripe.model.payment_link : PaymentLink;
import stripe.model.payment_pages_checkout_session_after_expiration : PaymentPagesCheckoutSessionAfterExpiration;
import stripe.model.payment_pages_checkout_session_automatic_tax : PaymentPagesCheckoutSessionAutomaticTax;
import stripe.model.payment_pages_checkout_session_consent : PaymentPagesCheckoutSessionConsent;
import stripe.model.payment_pages_checkout_session_consent_collection : PaymentPagesCheckoutSessionConsentCollection;
import stripe.model.payment_pages_checkout_session_custom_text : PaymentPagesCheckoutSessionCustomText;
import stripe.model.payment_pages_checkout_session_customer_details : PaymentPagesCheckoutSessionCustomerDetails;
import stripe.model.payment_pages_checkout_session_invoice_creation : PaymentPagesCheckoutSessionInvoiceCreation;
import stripe.model.payment_pages_checkout_session_phone_number_collection : PaymentPagesCheckoutSessionPhoneNumberCollection;
import stripe.model.payment_pages_checkout_session_shipping_address_collection : PaymentPagesCheckoutSessionShippingAddressCollection;
import stripe.model.payment_pages_checkout_session_shipping_cost : PaymentPagesCheckoutSessionShippingCost;
import stripe.model.payment_pages_checkout_session_shipping_option : PaymentPagesCheckoutSessionShippingOption;
import stripe.model.payment_pages_checkout_session_tax_id_collection : PaymentPagesCheckoutSessionTaxIdCollection;
import stripe.model.payment_pages_checkout_session_total_details : PaymentPagesCheckoutSessionTotalDetails;
import stripe.model.setup_intent : SetupIntent;
import stripe.model.shipping : Shipping;
import stripe.model.subscription : Subscription;

/**
 * A Checkout Session represents your customer's session as they pay for
 * one-time purchases or subscriptions through
 * [Checkout](https://stripe.com/docs/payments/checkout)
 * or [Payment Links](https://stripe.com/docs/payments/payment-links). We recommend creating a
 * new Session each time your customer attempts to pay.
 * Once payment is successful, the Checkout Session will contain a reference
 * to the [Customer](https://stripe.com/docs/api/customers), and either the successful
 * [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active
 * [Subscription](https://stripe.com/docs/api/subscriptions).
 * You can create a Checkout Session on your server and pass its ID to the
 * client to begin Checkout.
 * Related guide: [Checkout Quickstart](https://stripe.com/docs/checkout/quickstart).
 */
class CheckoutSession {
  /**
   * The ID of the original expired Checkout Session that triggered the recovery flow.
   */
  @optional
  string recovered_from;

  /**
   * Unique identifier for the object. Used to pass to `redirectToCheckout`
   * in Stripe.js.
   */
  @optional
  string id;

  /**
   * The mode of the Checkout Session.
   */
  @optional
  string mode;

  /**
   * Total of all items after discounts and taxes are applied.
   */
  @optional
  Nullable!(int) amount_total;

  /**
   * Results of `consent_collection` for this session.
   */
  @optional
  PaymentPagesCheckoutSessionConsent consent;

  /**
   * Shipping information for this Checkout Session.
   */
  @optional
  Shipping shipping_details;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  PaymentPagesCheckoutSessionCustomText custom_text;

  /**
   * ID of the invoice created by the Checkout Session, if it exists.
   */
  @optional
  Json invoice;

  /**
   * The customer details including the customer's tax exempt status and the customer's tax IDs.
   * Only the customer's email is present on Sessions in `setup` mode.
   */
  @optional
  PaymentPagesCheckoutSessionCustomerDetails customer_details;

  /**
   * Configure whether a Checkout Session should collect a payment method.
   */
  @optional
  string payment_method_collection;

  /**
   * The ID of the subscription for Checkout Sessions in `subscription` mode.
   */
  @optional
  Json subscription;

  /**
   * The ID of the customer for this Session.
   * For Checkout Sessions in `payment` or `subscription` mode, Checkout
   * will create a new customer object based on information provided
   * during the payment flow unless an existing customer was provided when
   * the Session was created.
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
   * Enables user redeemable promotion codes.
   */
  @optional
  Nullable!(bool) allow_promotion_codes;

  /**
   * The payment status of the Checkout Session, one of `paid`, `unpaid`, or
   * `no_payment_required`.
   * You can use this value to decide when to fulfill your customer's order.
   */
  @optional
  string payment_status;

  /**
   * The URL to the Checkout Session. Redirect customers to this URL to take them to Checkout. If
   * you’re using [Custom Domains](https://stripe.com/docs/payments/checkout/custom-domains),
   * the URL will use your subdomain. Otherwise, it’ll use `checkout.stripe.com.`
   * This value is only present when the session is active.
   */
  @optional
  string url;

  /**
   * Configure whether a Checkout Session creates a Customer when the Checkout Session completes.
   */
  @optional
  string customer_creation;

  /**
   * The shipping rate options applied to this Session.
   */
  @optional
  PaymentPagesCheckoutSessionShippingOption[] shipping_options;

  /**
   * Details on the state of invoice creation for the Checkout Session.
   */
  @optional
  PaymentPagesCheckoutSessionInvoiceCreation invoice_creation;

  /**
   * Describes whether Checkout should collect the customer's billing address.
   */
  @optional
  string billing_address_collection;

  /**
   * The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the
   * browser's locale is used.
   */
  @optional
  string locale;

  /**
   * When set, provides configuration for the Checkout Session to gather active consent from
   * customers.
   */
  @optional
  PaymentPagesCheckoutSessionConsentCollection consent_collection;

  /**
   * The timestamp at which the Checkout Session will expire.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * A unique string to reference the Checkout Session. This can be a
   * customer ID, a cart ID, or similar, and can be used to reconcile the
   * Session with your internal systems.
   */
  @optional
  string client_reference_id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  static class PaymentPagesCheckoutSessionListLineItems {
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

  }

  /**
   * The line items purchased by the customer.
   */
  @optional
  PaymentPagesCheckoutSessionListLineItems line_items;

  /**
   * When set, provides configuration for actions to take if this Checkout Session expires.
   */
  @optional
  PaymentPagesCheckoutSessionAfterExpiration after_expiration;

  /**
   * The URL the customer will be directed to after the payment or
   * subscription creation is successful.
   */
  @optional
  string success_url;

  /**
   * The ID of the Payment Link that created this Session.
   */
  @optional
  Json payment_link;

  /**
   * When set, provides configuration for Checkout to collect a shipping address from a customer.
   */
  @optional
  PaymentPagesCheckoutSessionShippingAddressCollection shipping_address_collection;

  /**
   * The status of the Checkout Session, one of `open`, `complete`, or `expired`.
   */
  @optional
  string status;

  /**
   * The URL the customer will be directed to if they decide to cancel payment and return to your
   * website.
   */
  @optional
  string cancel_url;

  /**
   * Tax and discount details for the computed total amount.
   */
  @optional
  PaymentPagesCheckoutSessionTotalDetails total_details;

  /**
   * The ID of the PaymentIntent for Checkout Sessions in `payment` mode.
   */
  @optional
  Json payment_intent;

  @optional
  PaymentPagesCheckoutSessionTaxIdCollection tax_id_collection;

  /**
   * Payment-method-specific configuration for the PaymentIntent or SetupIntent of this
   * CheckoutSession.
   */
  @optional
  CheckoutSessionPaymentMethodOptions payment_method_options;

  /**
   * The details of the customer cost of shipping, including the customer chosen ShippingRate.
   */
  @optional
  PaymentPagesCheckoutSessionShippingCost shipping_cost;

  /**
   * If provided, this value will be used when the Customer object is created.
   * If not provided, customers will be asked to enter their email address.
   * Use this parameter to prefill customer data if you already have an email
   * on file. To access information about the customer once the payment flow is
   * complete, use the `customer` attribute.
   */
  @optional
  string customer_email;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Total of all items before discounts or taxes are applied.
   */
  @optional
  Nullable!(int) amount_subtotal;

  /**
   * The ID of the SetupIntent for Checkout Sessions in `setup` mode.
   */
  @optional
  Json setup_intent;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * A list of the types of payment methods (e.g. card) this Checkout
   * Session is allowed to accept.
   */
  @optional
  string[] payment_method_types;

  @optional
  PaymentPagesCheckoutSessionPhoneNumberCollection phone_number_collection;

  /**
   * Describes the type of transaction being performed by Checkout in order to customize
   * relevant text on the page, such as the submit button. `submit_type` can only be
   * specified on Checkout Sessions in `payment` mode, but not Checkout Sessions
   * in `subscription` or `setup` mode.
   */
  @optional
  string submit_type;

  @optional
  PaymentPagesCheckoutSessionAutomaticTax automatic_tax;

}
