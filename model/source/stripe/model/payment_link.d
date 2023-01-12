// File automatically generated from OpenAPI spec.
module stripe.model.payment_link;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.item : Item;
import stripe.model.payment_links_resource_after_completion : PaymentLinksResourceAfterCompletion;
import stripe.model.payment_links_resource_automatic_tax : PaymentLinksResourceAutomaticTax;
import stripe.model.payment_links_resource_consent_collection : PaymentLinksResourceConsentCollection;
import stripe.model.payment_links_resource_custom_text : PaymentLinksResourceCustomText;
import stripe.model.payment_links_resource_payment_intent_data : PaymentLinksResourcePaymentIntentData;
import stripe.model.payment_links_resource_phone_number_collection : PaymentLinksResourcePhoneNumberCollection;
import stripe.model.payment_links_resource_shipping_address_collection : PaymentLinksResourceShippingAddressCollection;
import stripe.model.payment_links_resource_shipping_option : PaymentLinksResourceShippingOption;
import stripe.model.payment_links_resource_subscription_data : PaymentLinksResourceSubscriptionData;
import stripe.model.payment_links_resource_tax_id_collection : PaymentLinksResourceTaxIdCollection;
import stripe.model.payment_links_resource_transfer_data : PaymentLinksResourceTransferData;

/**
 * A payment link is a shareable URL that will take your customers to a hosted payment page. A
 * payment link can be shared and used multiple times.
 * When a customer opens a payment link it will open a new [checkout
 * session](https://stripe.com/docs/api/checkout/sessions) to render the payment page. You can use
 * [checkout session
 * events](https://stripe.com/docs/api/events/types#event_types-checkout.session.completed) to
 * track payments through payment links.
 * Related guide: [Payment Links API](https://stripe.com/docs/payments/payment-links/api)
 */
class PaymentLink {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Whether the payment link's `url` is active. If `false`, customers visiting the URL will be
   * shown a page saying that the link has been deactivated.
   */
  @optional
  Nullable!(bool) active;

  @optional
  PaymentLinksResourceCustomText custom_text;

  /**
   * The account on behalf of which to charge. See the [Connect
   * documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-a
   * ccounts) for details.
   */
  @optional
  Json on_behalf_of;

  /**
   * Configuration for collecting a payment method during checkout.
   */
  @optional
  string payment_method_collection;

  @optional
  PaymentLinksResourceAfterCompletion after_completion;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Whether user redeemable promotion codes are enabled.
   */
  @optional
  Nullable!(bool) allow_promotion_codes;

  /**
   * This represents the percentage of the subscription invoice subtotal that will be transferred
   * to the application owner's Stripe account.
   */
  @optional
  Nullable!(float) application_fee_percent;

  /**
   * The public URL that can be shared with customers.
   */
  @optional
  string url;

  /**
   * Configuration for Customer creation during checkout.
   */
  @optional
  string customer_creation;

  /**
   * The account (if any) the payments will be attributed to for tax reporting, and where funds
   * from each payment will be transferred to.
   */
  @optional
  PaymentLinksResourceTransferData transfer_data;

  /**
   * The shipping rate options applied to the session.
   */
  @optional
  PaymentLinksResourceShippingOption[] shipping_options;

  /**
   * Configuration for collecting the customer's billing address.
   */
  @optional
  string billing_address_collection;

  /**
   * When set, provides configuration to gather active consent from customers.
   */
  @optional
  PaymentLinksResourceConsentCollection consent_collection;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  static class PaymentLinksResourceListLineItems {
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
   * The line items representing what is being sold.
   */
  @optional
  PaymentLinksResourceListLineItems line_items;

  /**
   * Indicates the parameters to be passed to PaymentIntent creation during checkout.
   */
  @optional
  PaymentLinksResourcePaymentIntentData payment_intent_data;

  /**
   * When creating a subscription, the specified configuration data will be used. There must be at
   * least one line item with a recurring price to use `subscription_data`.
   */
  @optional
  PaymentLinksResourceSubscriptionData subscription_data;

  /**
   * The amount of the application fee (if any) that will be requested to be applied to the
   * payment and transferred to the application owner's Stripe account.
   */
  @optional
  Nullable!(int) application_fee_amount;

  /**
   * Configuration for collecting the customer's shipping address.
   */
  @optional
  PaymentLinksResourceShippingAddressCollection shipping_address_collection;

  @optional
  PaymentLinksResourceTaxIdCollection tax_id_collection;

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

  @optional
  PaymentLinksResourcePhoneNumberCollection phone_number_collection;

  /**
   * The list of payment method types that customers can use. When `null`, Stripe will dynamically
   * show relevant payment methods you've enabled in your [payment method
   * settings](https://dashboard.stripe.com/settings/payment_methods).
   */
  @optional
  string[] payment_method_types;

  /**
   * Indicates the type of transaction being performed which customizes relevant text on the page,
   * such as the submit button.
   */
  @optional
  string submit_type;

  @optional
  PaymentLinksResourceAutomaticTax automatic_tax;

  mixin AddBuilder!(typeof(this));

}
