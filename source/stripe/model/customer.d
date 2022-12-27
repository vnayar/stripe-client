// File automatically generated from OpenAPI spec.
module stripe.model.customer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;
import stripe.model.cash_balance : CashBalance;
import stripe.model.customer_tax : CustomerTax;
import stripe.model.discount : Discount;
import stripe.model.invoice_setting_customer_setting : InvoiceSettingCustomerSetting;
import stripe.model.shipping : Shipping;
import stripe.model.source : Source;
import stripe.model.subscription : Subscription;
import stripe.model.tax_id : TaxId;
import stripe.model.test_helpers.test_clock : TestHelpersTestClock;

/**
 * This object represents a customer of your business. It lets you create recurring charges and
 * track payments that belong to the same customer.
 * Related guide: [Save a card during
 * payment](https://stripe.com/docs/payments/save-during-payment).
 */
class Customer {
  /**
   * The customer's email address.
   */
  @optional
  Nullable!(string) email;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * Current balance, if any, being stored on the customer. If negative, the customer has credit
   * to apply to their next invoice. If positive, the customer has an amount owed that will be
   * added to their next invoice. The balance does not refer to any unpaid invoices; it solely
   * takes into account amounts that have yet to be successfully applied to any invoice. This
   * balance is only taken into account as invoices are finalized.
   */
  @optional
  Nullable!(int) balance;

  /**
   * The customer's full name or business name.
   */
  @optional
  Nullable!(string) name;

  static class TaxIDsList {
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
    TaxId[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * The customer's tax IDs.
   */
  @optional
  TaxIDsList tax_ids;

  /**
   * The customer's address.
   */
  @optional
  Address address;

  /**
   * The customer's preferred locales (languages), ordered by preference.
   */
  @optional
  Nullable!(string)[] preferred_locales;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  CustomerTax tax;

  /**
   * Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can
   * be charged in for recurring billing purposes.
   */
  @optional
  Nullable!(string) currency;

  static class ApmsSourcesSourceList {
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
    Json[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * The customer's payment sources, if any.
   */
  @optional
  ApmsSourcesSourceList sources;

  /**
   * The customer's phone number.
   */
  @optional
  Nullable!(string) phone;

  /**
   * The current multi-currency balances, if any, being stored on the customer. If positive in a
   * currency, the customer has a credit to apply to their next invoice denominated in that
   * currency. If negative, the customer has an amount owed that will be added to their next
   * invoice denominated in that currency. These balances do not refer to any unpaid invoices.
   * They solely track amounts that have yet to be successfully applied to any invoice. A balance
   * in a particular currency is only applied to any invoice as an invoice in that currency is
   * finalized.
   */
  @optional
  Nullable!(int)[string] invoice_credit_balance;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  static class SubscriptionList {
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
    Subscription[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * The customer's current subscriptions, if any.
   */
  @optional
  SubscriptionList subscriptions;

  /**
   * The suffix of the customer's next invoice number, e.g., 0001.
   */
  @optional
  Nullable!(int) next_invoice_sequence;

  /**
   * The current funds being held by Stripe on behalf of the customer. These funds can be applied
   * towards payment intents with source "cash_balance". The settings[reconciliation_mode] field
   * describes whether these funds are applied to such payment intents manually or automatically.
   */
  @optional
  CashBalance cash_balance;

  /**
   * ID of the test clock this customer belongs to.
   */
  @optional
  Json test_clock;

  /**
   * The prefix for the customer used to generate unique invoice numbers.
   */
  @optional
  Nullable!(string) invoice_prefix;

  /**
   * ID of the default payment source for the customer.
   * If you are using payment methods created via the PaymentMethods API, see the
   * [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#custom
   * er_object-invoice_settings-default_payment_method) field instead.
   */
  @optional
  Json default_source;

  /**
   * Describes the current discount active on the customer, if there is one.
   */
  @optional
  Discount discount;

  /**
   * When the customer's latest invoice is billed by charging automatically, `delinquent` is
   * `true` if the invoice's latest charge failed. When the customer's latest invoice is billed by
   * sending an invoice, `delinquent` is `true` if the invoice isn't paid by its due date.
   * If an invoice is marked uncollectible by
   * [dunning](https://stripe.com/docs/billing/automatic-collection), `delinquent` doesn't get
   * reset to `false`.
   */
  @optional
  Nullable!(bool) delinquent;

  @optional
  InvoiceSettingCustomerSetting invoice_settings;

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
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

  /**
   * Mailing and shipping address for the customer. Appears on invoices emailed to this customer.
   */
  @optional
  Shipping shipping;

  /**
   * Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`. When
   * set to `reverse`, invoice and receipt PDFs include the text **"Reverse charge"**.
   */
  @optional
  Nullable!(string) tax_exempt;

}
