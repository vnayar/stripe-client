// File automatically generated from OpenAPI spec.
module stripe.service.v1_customers_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;
import builder : AddBuilder;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.bank_account : BankAccount;
public import stripe.model.card : Card;
public import stripe.model.cash_balance : CashBalance;
public import stripe.model.customer : Customer;
public import stripe.model.customer_balance_transaction : CustomerBalanceTransaction;
public import stripe.model.customer_cash_balance_transaction : CustomerCashBalanceTransaction;
public import stripe.model.deleted_customer : DeletedCustomer;
public import stripe.model.deleted_discount : DeletedDiscount;
public import stripe.model.deleted_payment_source : DeletedPaymentSource;
public import stripe.model.deleted_tax_id : DeletedTaxId;
public import stripe.model.discount : Discount;
public import stripe.model.error : Error_;
public import stripe.model.funding_instructions : FundingInstructions;
public import stripe.model.payment_method : PaymentMethod;
public import stripe.model.payment_source : PaymentSource;
public import stripe.model.source : Source;
public import stripe.model.subscription : Subscription;
public import stripe.model.tax_id : TaxId;

/**
 * Service to make REST API calls to paths beginning with: /v1/customers
 */
class V1CustomersService {
  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string subscription_exposed_id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the subscription with the given ID.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/subscriptions/{subscription_exposed_id}`
   */
  void getCustomersCustomerSubscriptionsSubscriptionExposedId(
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams params,
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    string customer;

    /**
     */
    string subscription_exposed_id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSubscriptionsSubscriptionExposedIdBody {
    /**
     * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
     * attempt to pay this subscription at the end of the cycle using the default source attached to
     * the customer. When sending an invoice, Stripe will email your customer an invoice with
     * payment instructions and mark the subscription as `active`. Defaults to
     * `charge_automatically`.
     */
    @optional
    string collection_method;

    /**
     * The tax rates that will apply to any subscription item that does not have `tax_rates` set.
     * Invoices created will have their `default_tax_rates` populated from the subscription. Pass an
     * empty string to remove previously-defined tax rates.
     */
    @optional
    Json default_tax_rates;

    /**
     * Boolean indicating whether this subscription should cancel at the end of the current period.
     */
    @optional
    Nullable!(bool) cancel_at_period_end;

    /**
     * Specifies an interval for how often to bill for any pending invoice items. It is analogous to
     * calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given
     * subscription at the specified interval.
     */
    @optional
    Json pending_invoice_item_interval;

    /**
     * Number of days a customer has to pay invoices generated by this subscription. Valid only for
     * subscriptions where `collection_method` is set to `send_invoice`.
     */
    @optional
    Nullable!(int) days_until_due;

    /**
     * Determines how to handle
     * [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing
     * cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting
     * a trial), or if an item's `quantity` changes.
     */
    @optional
    string proration_behavior;

    /**
     * The ID of the coupon to apply to this subscription. A coupon applied to a subscription will
     * only affect invoices created for that particular subscription.
     */
    @optional
    string coupon;

    static class SubscriptionItemUpdateParams {
      @optional
      string id;

      @optional
      Nullable!(bool) clear_usage;

      @optional
      Json metadata;

      @optional
      Nullable!(int) quantity;

      @optional
      Json billing_thresholds;

      static class RecurringPriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RecurringPriceData price_data;

      @optional
      Json tax_rates;

      @optional
      Nullable!(bool) deleted;

      @optional
      string price;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A list of up to 20 subscription items, each with an attached price.
     */
    @optional
    SubscriptionItemUpdateParams[] items;

    /**
     * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
     * the percentage of the subscription invoice subtotal that will be transferred to the
     * application owner's Stripe account. The request must be made by a platform account on a
     * connected account in order to set an application fee percentage. For more information, see
     * the application fees
     * [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscription
     * s).
     */
    @optional
    Nullable!(float) application_fee_percent;

    /**
     * ID of the default payment method for the subscription. It must belong to the customer
     * associated with the subscription. This takes precedence over `default_source`. If neither are
     * set, invoices will use the customer's
     * [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#custom
     * er_object-invoice_settings-default_payment_method) or
     * [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source)
     * .
     */
    @optional
    string default_payment_method;

    static class PaymentSettings {
      @optional
      Json payment_method_types;

      static class PaymentMethodOptions {
        @optional
        Json card;

        @optional
        Json bancontact;

        @optional
        Json konbini;

        @optional
        Json acss_debit;

        @optional
        Json customer_balance;

        @optional
        Json us_bank_account;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PaymentMethodOptions payment_method_options;

      @optional
      string save_default_payment_method;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment settings to pass to invoices created by the subscription.
     */
    @optional
    PaymentSettings payment_settings;

    /**
     * If specified, the funds from the subscription's invoices will be transferred to the
     * destination and the ID of the resulting transfers will be found on the resulting charges.
     * This will be unset if you POST an empty value.
     */
    @optional
    Json transfer_data;

    /**
     * Either `now` or `unchanged`. Setting the value to `now` resets the subscription's billing
     * cycle anchor to the current time. For more information, see the billing cycle
     * [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
     */
    @optional
    string billing_cycle_anchor;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Define thresholds at which an invoice will be sent, and the subscription advanced to a new
     * billing period. Pass an empty string to remove previously-defined thresholds.
     */
    @optional
    Json billing_thresholds;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class AddInvoiceItemEntry {
      static class OneTimePriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OneTimePriceData price_data;

      @optional
      Nullable!(int) quantity;

      @optional
      Json tax_rates;

      @optional
      string price;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A list of prices and quantities that will generate invoice items appended to the next invoice
     * for this subscription. You may pass up to 20 items.
     */
    @optional
    AddInvoiceItemEntry[] add_invoice_items;

    /**
     * ID of the default payment source for the subscription. It must belong to the customer
     * associated with the subscription and be in a chargeable state. If `default_payment_method` is
     * also set, `default_payment_method` will take precedence. If neither are set, invoices will
     * use the customer's
     * [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#custom
     * er_object-invoice_settings-default_payment_method) or
     * [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source)
     * .
     */
    @optional
    string default_source;

    /**
     * A timestamp at which the subscription should cancel. If set to a date before the current
     * period ends, this will cause a proration if prorations have been enabled using
     * `proration_behavior`. If set during a future period, this will always cause a proration for
     * that period.
     */
    @optional
    Json cancel_at;

    /**
     * Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting
     * `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to
     * `true` together with `trial_end` is not allowed. See [Using trial periods on
     * subscriptions](https://stripe.com/docs/billing/subscriptions/trials) to learn more.
     */
    @optional
    Nullable!(bool) trial_from_plan;

    /**
     * Unix timestamp representing the end of the trial period the customer will get before being
     * charged for the first time. This will always overwrite any trials that might apply via a
     * subscribed plan. If set, trial_end will override the default trial period of the plan the
     * customer is being subscribed to. The special value `now` can be provided to end the
     * customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
     */
    @optional
    Json trial_end;

    /**
     * Indicates if a customer is on or off-session while an invoice payment is attempted.
     */
    @optional
    Nullable!(bool) off_session;

    /**
     * The promotion code to apply to this subscription. A promotion code applied to a subscription
     * will only affect invoices created for that particular subscription.
     */
    @optional
    string promotion_code;

    /**
     * Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is
     * required but cannot be paid. This allows you to manage scenarios where additional user
     * actions are needed to pay a subscription's invoice. For example, SCA regulation may require
     * 3DS authentication to complete payment. See the [SCA Migration
     * Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing
     * to learn more. This is the default behavior.
     * Use `default_incomplete` to transition the subscription to `status=past_due` when payment is
     * required and await explicit confirmation of the invoice's payment intent. This allows simpler
     * management of scenarios where additional user actions are needed to pay a subscription’s
     * invoice. Such as failed payments, [SCA
     * regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or
     * collecting a mandate for a bank debit payment method.
     * Use `pending_if_incomplete` to update the subscription using [pending
     * updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use
     * `pending_if_incomplete` you can only pass the parameters [supported by pending
     * updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).
     * Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a
     * subscription's invoice cannot be paid. For example, if a payment method requires 3DS
     * authentication due to SCA regulation and further user action is needed, this parameter does
     * not update the subscription and returns an error instead. This was the default behavior for
     * API versions prior to 2019-03-14. See the
     * [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
     */
    @optional
    string payment_behavior;

    /**
     * If specified, payment collection for this subscription will be paused.
     */
    @optional
    Json pause_collection;

    /**
     * If set, the proration will be calculated as though the subscription was updated at the given
     * time. This can be used to apply exactly the same proration that was previewed with [upcoming
     * invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint. It can also be used
     * to implement custom proration logic, such as prorating by day instead of by second, by
     * providing the time that you wish to use for proration calculations.
     */
    @optional
    Nullable!(long) proration_date;

    static class AutomaticTaxConfig {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Automatic tax settings for this subscription. We recommend you only include this parameter
     * when the existing value is being changed.
     */
    @optional
    AutomaticTaxConfig automatic_tax;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing subscription on a customer to match the specified parameters. When
   * changing plans or quantities, we will optionally prorate the price we charge next month to make
   * up for any price changes. To preview how the proration will be calculated, use the <a
   * href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/subscriptions/{subscription_exposed_id}`
   */
  void postCustomersCustomerSubscriptionsSubscriptionExposedId(
      PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams params,
      PostCustomersCustomerSubscriptionsSubscriptionExposedIdBody requestBody,
      PostCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    string customer;

    /**
     */
    string subscription_exposed_id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdBody {
    /**
     * Can be set to `true` if `at_period_end` is not set to `true`. Will generate a proration
     * invoice item that credits remaining unused time until the subscription period end.
     */
    @optional
    Nullable!(bool) prorate;

    /**
     * Can be set to `true` if `at_period_end` is not set to `true`. Will generate a final invoice
     * that invoices for any un-invoiced metered usage and new/pending proration invoice items.
     */
    @optional
    Nullable!(bool) invoice_now;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Cancels a customer’s subscription. If you set the <code>at_period_end</code> parameter to
   * <code>true</code>, the subscription will remain active until the end of the period, at which
   * point it will be canceled and not renewed. Otherwise, with the default <code>false</code>
   * value, the subscription is terminated immediately. In either case, the customer will not be
   * charged again for the subscription.</p>
   * <p>Note, however, that any pending invoice items that you’ve created will still be charged
   * for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If
   * you’ve set the subscription to cancel at the end of the period, any pending prorations will
   * also be left in place and collected at the end of the period. But if the subscription is set to
   * cancel immediately, pending prorations will be removed.</p>
   * <p>By default, upon subscription cancellation, Stripe will stop automatic collection of all
   * finalized invoices for the customer. This is intended to prevent unexpected payment attempts
   * after the customer has canceled a subscription. However, you can resume automatic collection of
   * the invoices manually after subscription cancellation to have us proceed. Or, you could check
   * for unpaid invoices before allowing the customer to cancel the subscription at all.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}/subscriptions/{subscription_exposed_id}`
   */
  void deleteCustomersCustomerSubscriptionsSubscriptionExposedId(
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams params,
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdBody requestBody,
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersParams {
    /**
     */
    Json created;

    /**
     * A case-sensitive filter on the list based on the customer's `email` field. The value must be
     * a string.
     */
    string email;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * Provides a list of customers that are associated with the specified test clock. The response
     * will not include customers with test clocks if this parameter is not set.
     */
    string test_clock;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersResponseHandler : ResponseHandler {

    static class CustomerResourceCustomerList {
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

      @optional
      Customer[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(CustomerResourceCustomerList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerResourceCustomerList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your customers. The customers are returned sorted by creation date, with
   * the most recent customers appearing first.</p>
   * See_Also: HTTP GET `/v1/customers`
   */
  void getCustomers(
      GetCustomersParams params,
      GetCustomersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.email.isNull)
      requestor.setQueryParam!("deepObject")("email", params.email);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.test_clock.isNull)
      requestor.setQueryParam!("deepObject")("test_clock", params.test_clock);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersBody {
    /**
     * Customer's email address. It's displayed alongside the customer in your dashboard and can be
     * useful for searching and tracking. This may be up to *512 characters*.
     */
    @optional
    string email;

    @optional
    string coupon;

    static class TaxParam {
      @optional
      Json ip_address;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Tax details about the customer.
     */
    @optional
    TaxParam tax;

    static class CustomerParam {
      @optional
      Json custom_fields;

      @optional
      string default_payment_method;

      @optional
      string footer;

      @optional
      Json rendering_options;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Default invoice settings for this customer.
     */
    @optional
    CustomerParam invoice_settings;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    @optional
    string source;

    /**
     * An integer amount in cents (or local equivalent) that represents the customer's current
     * balance, which affect the customer's future invoices. A negative amount represents a credit
     * that decreases the amount due on an invoice; a positive amount increases the amount due on an
     * invoice.
     */
    @optional
    Nullable!(int) balance;

    /**
     * The customer's full name or business name.
     */
    @optional
    string name;

    @optional
    string payment_method;

    static class CashBalanceParam {
      static class BalanceSettingsParam {
        @optional
        string reconciliation_mode;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      BalanceSettingsParam settings;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Balance information and default balance settings for this customer.
     */
    @optional
    CashBalanceParam cash_balance;

    /**
     * The sequence to be used on the customer's next invoice. Defaults to 1.
     */
    @optional
    Nullable!(int) next_invoice_sequence;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The customer's address.
     */
    @optional
    Json address;

    /**
     * The API ID of a promotion code to apply to the customer. The customer will have a discount
     * applied on all recurring payments. Charges you create through the API will not have the
     * discount.
     */
    @optional
    string promotion_code;

    /**
     * The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase
     * letters or numbers.
     */
    @optional
    string invoice_prefix;

    /**
     * The customer's phone number.
     */
    @optional
    string phone;

    /**
     * An arbitrary string that you can attach to a customer object. It is displayed alongside the
     * customer in the dashboard.
     */
    @optional
    string description;

    /**
     * The customer's shipping information. Appears on invoices emailed to this customer.
     */
    @optional
    Json shipping;

    /**
     * Customer's preferred languages, ordered by preference.
     */
    @optional
    string[] preferred_locales;

    /**
     * The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
     */
    @optional
    string tax_exempt;

    static class DataParams {
      @optional
      string type;

      @optional
      string value;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The customer's tax IDs.
     */
    @optional
    DataParams[] tax_id_data;

    /**
     * ID of the test clock to attach to the customer.
     */
    @optional
    string test_clock;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Customer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Customer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new customer object.</p>
   * See_Also: HTTP POST `/v1/customers`
   */
  void postCustomers(
      PostCustomersBody requestBody,
      PostCustomersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerBalanceTransactionsTransactionParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string transaction;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerBalanceTransactionsTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerBalanceTransaction)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a specific customer balance transaction that updated the customer’s <a
   * href="/docs/billing/customer/balance">balances</a>.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/balance_transactions/{transaction}`
   */
  void getCustomersCustomerBalanceTransactionsTransaction(
      GetCustomersCustomerBalanceTransactionsTransactionParams params,
      GetCustomersCustomerBalanceTransactionsTransactionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions/{transaction}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.transaction.isNull)
      requestor.setPathParam("transaction", params.transaction);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBalanceTransactionsTransactionParams {
    /**
     */
    string customer;

    /**
     */
    string transaction;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBalanceTransactionsTransactionBody {
    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBalanceTransactionsTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerBalanceTransaction)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Most credit balance transaction fields are immutable, but you may update its
   * <code>description</code> and <code>metadata</code>.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/balance_transactions/{transaction}`
   */
  void postCustomersCustomerBalanceTransactionsTransaction(
      PostCustomersCustomerBalanceTransactionsTransactionParams params,
      PostCustomersCustomerBalanceTransactionsTransactionBody requestBody,
      PostCustomersCustomerBalanceTransactionsTransactionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions/{transaction}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.transaction.isNull)
      requestor.setPathParam("transaction", params.transaction);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerDiscountParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Discount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Discount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * See_Also: HTTP GET `/v1/customers/{customer}/discount`
   */
  void getCustomersCustomerDiscount(
      GetCustomersCustomerDiscountParams params,
      GetCustomersCustomerDiscountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerDiscountParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedDiscount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedDiscount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Removes the currently applied discount on a customer.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}/discount`
   */
  void deleteCustomersCustomerDiscount(
      DeleteCustomersCustomerDiscountParams params,
      DeleteCustomersCustomerDiscountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCardsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerCardsResponseHandler : ResponseHandler {

    static class CardList {
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

      @optional
      Card[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(CardList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CardList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can see a list of the cards belonging to a customer.
   * Note that the 10 most recent sources are always available on the <code>Customer</code> object.
   * If you need more than those 10, you can use this API method and the <code>limit</code> and
   * <code>starting_after</code> parameters to page through additional cards.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/cards`
   */
  void getCustomersCustomerCards(
      GetCustomersCustomerCardsParams params,
      GetCustomersCustomerCardsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerCardsParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerCardsBody {
    /**
     * A token returned by [Stripe.js](https://stripe.com/docs/js) representing the user’s Alipay
     * account details.
     */
    @optional
    string alipay_account;

    /**
     * A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
     */
    @optional
    Json card;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Please refer to full [documentation](https://stripe.com/docs/api) instead.
     */
    @optional
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerCardsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When you create a new credit card, you must specify a customer or recipient on which to
   * create it.</p>
   * <p>If the card’s owner has no default card, then the new card will become the default.
   * However, if the owner already has a default, then it will not change.
   * To change the default, you should <a href="/docs/api#update_customer">update the customer</a>
   * to have a new <code>default_source</code>.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/cards`
   */
  void postCustomersCustomerCards(
      PostCustomersCustomerCardsParams params,
      PostCustomersCustomerCardsBody requestBody,
      PostCustomersCustomerCardsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerSubscriptionsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerSubscriptionsResponseHandler : ResponseHandler {

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      Subscription[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(SubscriptionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(SubscriptionList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can see a list of the customer’s active subscriptions. Note that the 10 most recent
   * active subscriptions are always available by default on the customer object. If you need more
   * than those 10, you can use the limit and starting_after parameters to page through additional
   * subscriptions.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/subscriptions`
   */
  void getCustomersCustomerSubscriptions(
      GetCustomersCustomerSubscriptionsParams params,
      GetCustomersCustomerSubscriptionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSubscriptionsParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSubscriptionsBody {
    /**
     * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
     * attempt to pay this subscription at the end of the cycle using the default source attached to
     * the customer. When sending an invoice, Stripe will email your customer an invoice with
     * payment instructions and mark the subscription as `active`. Defaults to
     * `charge_automatically`.
     */
    @optional
    string collection_method;

    /**
     * The tax rates that will apply to any subscription item that does not have `tax_rates` set.
     * Invoices created will have their `default_tax_rates` populated from the subscription.
     */
    @optional
    Json default_tax_rates;

    /**
     * Boolean indicating whether this subscription should cancel at the end of the current period.
     */
    @optional
    Nullable!(bool) cancel_at_period_end;

    /**
     * Specifies an interval for how often to bill for any pending invoice items. It is analogous to
     * calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given
     * subscription at the specified interval.
     */
    @optional
    Json pending_invoice_item_interval;

    /**
     * Number of days a customer has to pay invoices generated by this subscription. Valid only for
     * subscriptions where `collection_method` is set to `send_invoice`.
     */
    @optional
    Nullable!(int) days_until_due;

    /**
     * Determines how to handle
     * [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) resulting from
     * the `billing_cycle_anchor`. If no value is passed, the default is `create_prorations`.
     */
    @optional
    string proration_behavior;

    /**
     * The ID of the coupon to apply to this subscription. A coupon applied to a subscription will
     * only affect invoices created for that particular subscription.
     */
    @optional
    string coupon;

    static class SubscriptionItemCreateParams {
      static class RecurringPriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RecurringPriceData price_data;

      @optional
      string[string] metadata;

      @optional
      Nullable!(int) quantity;

      @optional
      Json tax_rates;

      @optional
      string price;

      @optional
      Json billing_thresholds;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A list of up to 20 subscription items, each with an attached price.
     */
    @optional
    SubscriptionItemCreateParams[] items;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
     * the percentage of the subscription invoice subtotal that will be transferred to the
     * application owner's Stripe account. The request must be made by a platform account on a
     * connected account in order to set an application fee percentage. For more information, see
     * the application fees
     * [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscription
     * s).
     */
    @optional
    Nullable!(float) application_fee_percent;

    /**
     * ID of the default payment method for the subscription. It must belong to the customer
     * associated with the subscription. This takes precedence over `default_source`. If neither are
     * set, invoices will use the customer's
     * [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#custom
     * er_object-invoice_settings-default_payment_method) or
     * [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source)
     * .
     */
    @optional
    string default_payment_method;

    static class PaymentSettings {
      @optional
      Json payment_method_types;

      static class PaymentMethodOptions {
        @optional
        Json card;

        @optional
        Json bancontact;

        @optional
        Json konbini;

        @optional
        Json acss_debit;

        @optional
        Json customer_balance;

        @optional
        Json us_bank_account;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PaymentMethodOptions payment_method_options;

      @optional
      string save_default_payment_method;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment settings to pass to invoices created by the subscription.
     */
    @optional
    PaymentSettings payment_settings;

    static class TransferDataSpecs {
      @optional
      Nullable!(float) amount_percent;

      @optional
      string destination;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If specified, the funds from the subscription's invoices will be transferred to the
     * destination and the ID of the resulting transfers will be found on the resulting charges.
     */
    @optional
    TransferDataSpecs transfer_data;

    /**
     * Integer representing the number of trial period days before the customer is charged for the
     * first time. This will always overwrite any trials that might apply via a subscribed plan. See
     * [Using trial periods on subscriptions](https://stripe.com/docs/billing/subscriptions/trials)
     * to learn more.
     */
    @optional
    Nullable!(int) trial_period_days;

    /**
     * A future timestamp to anchor the subscription's [billing
     * cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the
     * date of the first full invoice, and, for plans with `month` or `year` intervals, the day of
     * the month for subsequent invoices. The timestamp is in UTC format.
     */
    @optional
    Nullable!(long) billing_cycle_anchor;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Define thresholds at which an invoice will be sent, and the subscription advanced to a new
     * billing period. Pass an empty string to remove previously-defined thresholds.
     */
    @optional
    Json billing_thresholds;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class AddInvoiceItemEntry {
      static class OneTimePriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OneTimePriceData price_data;

      @optional
      Nullable!(int) quantity;

      @optional
      Json tax_rates;

      @optional
      string price;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A list of prices and quantities that will generate invoice items appended to the next invoice
     * for this subscription. You may pass up to 20 items.
     */
    @optional
    AddInvoiceItemEntry[] add_invoice_items;

    /**
     * ID of the default payment source for the subscription. It must belong to the customer
     * associated with the subscription and be in a chargeable state. If `default_payment_method` is
     * also set, `default_payment_method` will take precedence. If neither are set, invoices will
     * use the customer's
     * [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#custom
     * er_object-invoice_settings-default_payment_method) or
     * [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source)
     * .
     */
    @optional
    string default_source;

    /**
     * A timestamp at which the subscription should cancel. If set to a date before the current
     * period ends, this will cause a proration if prorations have been enabled using
     * `proration_behavior`. If set during a future period, this will always cause a proration for
     * that period.
     */
    @optional
    Nullable!(long) cancel_at;

    /**
     * Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting
     * `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to
     * `true` together with `trial_end` is not allowed. See [Using trial periods on
     * subscriptions](https://stripe.com/docs/billing/subscriptions/trials) to learn more.
     */
    @optional
    Nullable!(bool) trial_from_plan;

    /**
     * For new subscriptions, a past timestamp to backdate the subscription's start date to. If set,
     * the first invoice will contain a proration for the timespan between the start date and the
     * current time. Can be combined with trials and the billing cycle anchor.
     */
    @optional
    Nullable!(long) backdate_start_date;

    /**
     * Unix timestamp representing the end of the trial period the customer will get before being
     * charged for the first time. This will always overwrite any trials that might apply via a
     * subscribed plan. If set, trial_end will override the default trial period of the plan the
     * customer is being subscribed to. The special value `now` can be provided to end the
     * customer's trial immediately. Can be at most two years from `billing_cycle_anchor`. See
     * [Using trial periods on subscriptions](https://stripe.com/docs/billing/subscriptions/trials)
     * to learn more.
     */
    @optional
    Json trial_end;

    /**
     * The API ID of a promotion code to apply to this subscription. A promotion code applied to a
     * subscription will only affect invoices created for that particular subscription.
     */
    @optional
    string promotion_code;

    /**
     * Indicates if a customer is on or off-session while an invoice payment is attempted.
     */
    @optional
    Nullable!(bool) off_session;

    /**
     * Only applies to subscriptions with `collection_method=charge_automatically`.
     * Use `allow_incomplete` to create subscriptions with `status=incomplete` if the first invoice
     * cannot be paid. Creating subscriptions with this status allows you to manage scenarios where
     * additional user actions are needed to pay a subscription's invoice. For example, SCA
     * regulation may require 3DS authentication to complete payment. See the [SCA Migration
     * Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing
     * to learn more. This is the default behavior.
     * Use `default_incomplete` to create Subscriptions with `status=incomplete` when the first
     * invoice requires payment, otherwise start as active. Subscriptions transition to
     * `status=active` when successfully confirming the payment intent on the first invoice. This
     * allows simpler management of scenarios where additional user actions are needed to pay a
     * subscription’s invoice. Such as failed payments, [SCA
     * regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or
     * collecting a mandate for a bank debit payment method. If the payment intent is not confirmed
     * within 23 hours subscriptions transition to `status=incomplete_expired`, which is a terminal
     * state.
     * Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a
     * subscription's first invoice cannot be paid. For example, if a payment method requires 3DS
     * authentication due to SCA regulation and further user action is needed, this parameter does
     * not create a subscription and returns an error instead. This was the default behavior for API
     * versions prior to 2019-03-14. See the
     * [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
     * `pending_if_incomplete` is only used with updates and cannot be passed when creating a
     * subscription.
     * Subscriptions with `collection_method=send_invoice` are automatically activated regardless of
     * the first invoice status.
     */
    @optional
    string payment_behavior;

    static class AutomaticTaxConfig {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Automatic tax settings for this subscription. We recommend you only include this parameter
     * when the existing value is being changed.
     */
    @optional
    AutomaticTaxConfig automatic_tax;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSubscriptionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new subscription on an existing customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/subscriptions`
   */
  void postCustomersCustomerSubscriptions(
      PostCustomersCustomerSubscriptionsParams params,
      PostCustomersCustomerSubscriptionsBody requestBody,
      PostCustomersCustomerSubscriptionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerSourcesParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * Filter sources according to a particular object type.
     */
    string object;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerSourcesResponseHandler : ResponseHandler {

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      Json[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(ApmsSourcesSourceList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ApmsSourcesSourceList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>List sources for a specified customer.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/sources`
   */
  void getCustomersCustomerSources(
      GetCustomersCustomerSourcesParams params,
      GetCustomersCustomerSourcesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.object.isNull)
      requestor.setQueryParam!("deepObject")("object", params.object);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSourcesParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSourcesBody {
    /**
     * A token returned by [Stripe.js](https://stripe.com/docs/js) representing the user’s Alipay
     * account details.
     */
    @optional
    string alipay_account;

    /**
     * A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
     */
    @optional
    Json card;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Please refer to full [documentation](https://stripe.com/docs/api) instead.
     */
    @optional
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSourcesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When you create a new credit card, you must specify a customer or recipient on which to
   * create it.</p>
   * <p>If the card’s owner has no default card, then the new card will become the default.
   * However, if the owner already has a default, then it will not change.
   * To change the default, you should <a href="/docs/api#update_customer">update the customer</a>
   * to have a new <code>default_source</code>.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/sources`
   */
  void postCustomersCustomerSources(
      PostCustomersCustomerSourcesParams params,
      PostCustomersCustomerSourcesBody requestBody,
      PostCustomersCustomerSourcesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerBankAccountsIdParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BankAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(BankAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>By default, you can see the 10 most recent sources stored on a Customer directly on the
   * object, but you can also retrieve details about a specific bank account stored on the Stripe
   * account.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/bank_accounts/{id}`
   */
  void getCustomersCustomerBankAccountsId(
      GetCustomersCustomerBankAccountsIdParams params,
      GetCustomersCustomerBankAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBankAccountsIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBankAccountsIdBody {
    /**
     * State/County/Province/Region.
     */
    @optional
    string address_state;

    /**
     * ZIP or postal code.
     */
    @optional
    string address_zip;

    /**
     * City/District/Suburb/Town/Village.
     */
    @optional
    string address_city;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Two digit number representing the card’s expiration month.
     */
    @optional
    string exp_month;

    /**
     * Billing address country, if provided when creating card.
     */
    @optional
    string address_country;

    static class Owner {
      @optional
      string email;

      @optional
      string phone;

      static class SourceAddress {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SourceAddress address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    @optional
    Owner owner;

    /**
     * Four digit number representing the card’s expiration year.
     */
    @optional
    string exp_year;

    /**
     * Address line 1 (Street address/PO Box/Company name).
     */
    @optional
    string address_line1;

    /**
     * Cardholder name.
     */
    @optional
    string name;

    /**
     * The name of the person or business that owns the bank account.
     */
    @optional
    string account_holder_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The type of entity that holds the account. This can be either `individual` or `company`.
     */
    @optional
    string account_holder_type;

    /**
     * Address line 2 (Apartment/Suite/Unit/Building).
     */
    @optional
    string address_line2;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Update a specified source for a given customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/bank_accounts/{id}`
   */
  void postCustomersCustomerBankAccountsId(
      PostCustomersCustomerBankAccountsIdParams params,
      PostCustomersCustomerBankAccountsIdBody requestBody,
      PostCustomersCustomerBankAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteCustomersCustomerBankAccountsIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerBankAccountsIdBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete a specified source for a given customer.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}/bank_accounts/{id}`
   */
  void deleteCustomersCustomerBankAccountsId(
      DeleteCustomersCustomerBankAccountsIdParams params,
      DeleteCustomersCustomerBankAccountsIdBody requestBody,
      DeleteCustomersCustomerBankAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerPaymentMethodsPaymentMethodParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string payment_method;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerPaymentMethodsPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a PaymentMethod object for a given Customer.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/payment_methods/{payment_method}`
   */
  void getCustomersCustomerPaymentMethodsPaymentMethod(
      GetCustomersCustomerPaymentMethodsPaymentMethodParams params,
      GetCustomersCustomerPaymentMethodsPaymentMethodResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/payment_methods/{payment_method}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCardsIdParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerCardsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Card response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Card)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can always see the 10 most recent cards directly on a customer; this method lets you
   * retrieve details about a specific card stored on the customer.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/cards/{id}`
   */
  void getCustomersCustomerCardsId(
      GetCustomersCustomerCardsIdParams params,
      GetCustomersCustomerCardsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerCardsIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerCardsIdBody {
    /**
     * State/County/Province/Region.
     */
    @optional
    string address_state;

    /**
     * ZIP or postal code.
     */
    @optional
    string address_zip;

    /**
     * City/District/Suburb/Town/Village.
     */
    @optional
    string address_city;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Two digit number representing the card’s expiration month.
     */
    @optional
    string exp_month;

    /**
     * Billing address country, if provided when creating card.
     */
    @optional
    string address_country;

    static class Owner {
      @optional
      string email;

      @optional
      string phone;

      static class SourceAddress {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SourceAddress address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    @optional
    Owner owner;

    /**
     * Four digit number representing the card’s expiration year.
     */
    @optional
    string exp_year;

    /**
     * Address line 1 (Street address/PO Box/Company name).
     */
    @optional
    string address_line1;

    /**
     * Cardholder name.
     */
    @optional
    string name;

    /**
     * The name of the person or business that owns the bank account.
     */
    @optional
    string account_holder_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The type of entity that holds the account. This can be either `individual` or `company`.
     */
    @optional
    string account_holder_type;

    /**
     * Address line 2 (Apartment/Suite/Unit/Building).
     */
    @optional
    string address_line2;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerCardsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Update a specified source for a given customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/cards/{id}`
   */
  void postCustomersCustomerCardsId(
      PostCustomersCustomerCardsIdParams params,
      PostCustomersCustomerCardsIdBody requestBody,
      PostCustomersCustomerCardsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteCustomersCustomerCardsIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerCardsIdBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerCardsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete a specified source for a given customer.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}/cards/{id}`
   */
  void deleteCustomersCustomerCardsId(
      DeleteCustomersCustomerCardsIdParams params,
      DeleteCustomersCustomerCardsIdBody requestBody,
      DeleteCustomersCustomerCardsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostCustomersCustomerBankAccountsIdVerifyParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBankAccountsIdVerifyBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank
     * account.
     */
    @optional
    Nullable!(int)[] amounts;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBankAccountsIdVerifyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BankAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(BankAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Verify a specified bank account for a given customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/bank_accounts/{id}/verify`
   */
  void postCustomersCustomerBankAccountsIdVerify(
      PostCustomersCustomerBankAccountsIdVerifyParams params,
      PostCustomersCustomerBankAccountsIdVerifyBody requestBody,
      PostCustomersCustomerBankAccountsIdVerifyResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}/verify");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerCashBalanceParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerCashBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CashBalance response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CashBalance)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a customer’s cash balance.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/cash_balance`
   */
  void getCustomersCustomerCashBalance(
      GetCustomersCustomerCashBalanceParams params,
      GetCustomersCustomerCashBalanceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerCashBalanceParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerCashBalanceBody {
    static class BalanceSettingsParam {
      @optional
      string reconciliation_mode;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A hash of settings for this cash balance.
     */
    @optional
    BalanceSettingsParam settings;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerCashBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CashBalance response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CashBalance)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Changes the settings on a customer’s cash balance.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/cash_balance`
   */
  void postCustomersCustomerCashBalance(
      PostCustomersCustomerCashBalanceParams params,
      PostCustomersCustomerCashBalanceBody requestBody,
      PostCustomersCustomerCashBalanceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerCashBalanceTransactionsTransactionParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string transaction;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerCashBalanceTransactionsTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerCashBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerCashBalanceTransaction)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a specific cash balance transaction, which updated the customer’s <a
   * href="/docs/payments/customer-balance">cash balance</a>.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/cash_balance_transactions/{transaction}`
   */
  void getCustomersCustomerCashBalanceTransactionsTransaction(
      GetCustomersCustomerCashBalanceTransactionsTransactionParams params,
      GetCustomersCustomerCashBalanceTransactionsTransactionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance_transactions/{transaction}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.transaction.isNull)
      requestor.setPathParam("transaction", params.transaction);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCashBalanceTransactionsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerCashBalanceTransactionsResponseHandler : ResponseHandler {

    static class CustomerCashBalanceTransactionList {
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
      CustomerCashBalanceTransaction[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(CustomerCashBalanceTransactionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerCashBalanceTransactionList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of transactions that modified the customer’s <a
   * href="/docs/payments/customer-balance">cash balance</a>.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/cash_balance_transactions`
   */
  void getCustomersCustomerCashBalanceTransactions(
      GetCustomersCustomerCashBalanceTransactionsParams params,
      GetCustomersCustomerCashBalanceTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance_transactions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerSourcesIdParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerSourcesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve a specified source for a given customer.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/sources/{id}`
   */
  void getCustomersCustomerSourcesId(
      GetCustomersCustomerSourcesIdParams params,
      GetCustomersCustomerSourcesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSourcesIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSourcesIdBody {
    /**
     * State/County/Province/Region.
     */
    @optional
    string address_state;

    /**
     * ZIP or postal code.
     */
    @optional
    string address_zip;

    /**
     * City/District/Suburb/Town/Village.
     */
    @optional
    string address_city;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Two digit number representing the card’s expiration month.
     */
    @optional
    string exp_month;

    /**
     * Billing address country, if provided when creating card.
     */
    @optional
    string address_country;

    static class Owner {
      @optional
      string email;

      @optional
      string phone;

      static class SourceAddress {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SourceAddress address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    @optional
    Owner owner;

    /**
     * Four digit number representing the card’s expiration year.
     */
    @optional
    string exp_year;

    /**
     * Address line 1 (Street address/PO Box/Company name).
     */
    @optional
    string address_line1;

    /**
     * Cardholder name.
     */
    @optional
    string name;

    /**
     * The name of the person or business that owns the bank account.
     */
    @optional
    string account_holder_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The type of entity that holds the account. This can be either `individual` or `company`.
     */
    @optional
    string account_holder_type;

    /**
     * Address line 2 (Apartment/Suite/Unit/Building).
     */
    @optional
    string address_line2;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSourcesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Update a specified source for a given customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/sources/{id}`
   */
  void postCustomersCustomerSourcesId(
      PostCustomersCustomerSourcesIdParams params,
      PostCustomersCustomerSourcesIdBody requestBody,
      PostCustomersCustomerSourcesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteCustomersCustomerSourcesIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerSourcesIdBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerSourcesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete a specified source for a given customer.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}/sources/{id}`
   */
  void deleteCustomersCustomerSourcesId(
      DeleteCustomersCustomerSourcesIdParams params,
      DeleteCustomersCustomerSourcesIdBody requestBody,
      DeleteCustomersCustomerSourcesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerBankAccountsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerBankAccountsResponseHandler : ResponseHandler {

    static class BankAccountList {
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
      BankAccount[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(BankAccountList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(BankAccountList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can see a list of the bank accounts belonging to a Customer. Note that the 10 most
   * recent sources are always available by default on the Customer. If you need more than those 10,
   * you can use this API method and the <code>limit</code> and <code>starting_after</code>
   * parameters to page through additional bank accounts.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/bank_accounts`
   */
  void getCustomersCustomerBankAccounts(
      GetCustomersCustomerBankAccountsParams params,
      GetCustomersCustomerBankAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBankAccountsParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBankAccountsBody {
    /**
     * A token returned by [Stripe.js](https://stripe.com/docs/js) representing the user’s Alipay
     * account details.
     */
    @optional
    string alipay_account;

    /**
     * A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
     */
    @optional
    Json card;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Please refer to full [documentation](https://stripe.com/docs/api) instead.
     */
    @optional
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBankAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When you create a new credit card, you must specify a customer or recipient on which to
   * create it.</p>
   * <p>If the card’s owner has no default card, then the new card will become the default.
   * However, if the owner already has a default, then it will not change.
   * To change the default, you should <a href="/docs/api#update_customer">update the customer</a>
   * to have a new <code>default_source</code>.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/bank_accounts`
   */
  void postCustomersCustomerBankAccounts(
      PostCustomersCustomerBankAccountsParams params,
      PostCustomersCustomerBankAccountsBody requestBody,
      PostCustomersCustomerBankAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostCustomersCustomerSourcesIdVerifyParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSourcesIdVerifyBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank
     * account.
     */
    @optional
    Nullable!(int)[] amounts;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerSourcesIdVerifyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BankAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(BankAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Verify a specified bank account for a given customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/sources/{id}/verify`
   */
  void postCustomersCustomerSourcesIdVerify(
      PostCustomersCustomerSourcesIdVerifyParams params,
      PostCustomersCustomerSourcesIdVerifyBody requestBody,
      PostCustomersCustomerSourcesIdVerifyResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}/verify");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerTaxIdsIdParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerTaxIdsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxId response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TaxId)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the <code>TaxID</code> object with the given identifier.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/tax_ids/{id}`
   */
  void getCustomersCustomerTaxIdsId(
      GetCustomersCustomerTaxIdsIdParams params,
      GetCustomersCustomerTaxIdsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerTaxIdsIdParams {
    /**
     */
    string customer;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerTaxIdsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedTaxId response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedTaxId)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Deletes an existing <code>TaxID</code> object.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}/tax_ids/{id}`
   */
  void deleteCustomersCustomerTaxIdsId(
      DeleteCustomersCustomerTaxIdsIdParams params,
      DeleteCustomersCustomerTaxIdsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerPaymentMethodsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * An optional filter on the list, based on the object `type` field. Without the filter, the
     * list includes all current and future payment method types. If your integration expects only
     * one type of payment method in the response, make sure to provide a type value in the request.
     */
    string type;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerPaymentMethodsResponseHandler : ResponseHandler {

    static class CustomerPaymentMethodResourceList {
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

      @optional
      PaymentMethod[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(CustomerPaymentMethodResourceList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerPaymentMethodResourceList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of PaymentMethods for a given Customer</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/payment_methods`
   */
  void getCustomersCustomerPaymentMethods(
      GetCustomersCustomerPaymentMethodsParams params,
      GetCustomersCustomerPaymentMethodsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/payment_methods");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.type.isNull)
      requestor.setQueryParam!("deepObject")("type", params.type);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string subscription_exposed_id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Discount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Discount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * See_Also: HTTP GET `/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount`
   */
  void getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount(
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams params,
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams {
    /**
     */
    string customer;

    /**
     */
    string subscription_exposed_id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedDiscount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedDiscount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Removes the currently applied discount on a customer.</p>
   * See_Also: HTTP DELETE
   * `/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount`
   */
  void deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount(
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams params,
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerParams {
    /**
     */
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a Customer object.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}`
   */
  void getCustomersCustomer(
      GetCustomersCustomerParams params,
      GetCustomersCustomerResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBody {
    /**
     * Customer's email address. It's displayed alongside the customer in your dashboard and can be
     * useful for searching and tracking. This may be up to *512 characters*.
     */
    @optional
    string email;

    /**
     * ID of card to make the customer's new default for invoice payments.
     */
    @optional
    string default_card;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    @optional
    string coupon;

    static class TaxParam {
      @optional
      Json ip_address;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Tax details about the customer.
     */
    @optional
    TaxParam tax;

    /**
     * ID of bank account to make the customer's new default for invoice payments.
     */
    @optional
    string default_bank_account;

    static class CustomerParam {
      @optional
      Json custom_fields;

      @optional
      string default_payment_method;

      @optional
      string footer;

      @optional
      Json rendering_options;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Default invoice settings for this customer.
     */
    @optional
    CustomerParam invoice_settings;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * ID of Alipay account to make the customer's new default for invoice payments.
     */
    @optional
    string default_alipay_account;

    @optional
    string source;

    /**
     * An integer amount in cents (or local equivalent) that represents the customer's current
     * balance, which affect the customer's future invoices. A negative amount represents a credit
     * that decreases the amount due on an invoice; a positive amount increases the amount due on an
     * invoice.
     */
    @optional
    Nullable!(int) balance;

    /**
     * The customer's full name or business name.
     */
    @optional
    string name;

    /**
     * A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
     */
    @optional
    Json card;

    static class CashBalanceParam {
      static class BalanceSettingsParam {
        @optional
        string reconciliation_mode;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      BalanceSettingsParam settings;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Balance information and default balance settings for this customer.
     */
    @optional
    CashBalanceParam cash_balance;

    /**
     * The sequence to be used on the customer's next invoice. Defaults to 1.
     */
    @optional
    Nullable!(int) next_invoice_sequence;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The customer's address.
     */
    @optional
    Json address;

    /**
     * The API ID of a promotion code to apply to the customer. The customer will have a discount
     * applied on all recurring payments. Charges you create through the API will not have the
     * discount.
     */
    @optional
    string promotion_code;

    /**
     * The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase
     * letters or numbers.
     */
    @optional
    string invoice_prefix;

    /**
     * The customer's phone number.
     */
    @optional
    string phone;

    /**
     * An arbitrary string that you can attach to a customer object. It is displayed alongside the
     * customer in the dashboard.
     */
    @optional
    string description;

    /**
     * The customer's shipping information. Appears on invoices emailed to this customer.
     */
    @optional
    Json shipping;

    /**
     * Customer's preferred languages, ordered by preference.
     */
    @optional
    string[] preferred_locales;

    /**
     * The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
     */
    @optional
    string tax_exempt;

    /**
     * If you are using payment methods created via the PaymentMethods API, see the
     * [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/update#update
     * _customer-invoice_settings-default_payment_method) parameter.
     * Provide the ID of a payment source already attached to this customer to make it this
     * customer's default payment source.
     * If you want to add a new payment source and make it the default, see the
     * [source](https://stripe.com/docs/api/customers/update#update_customer-source) property.
     */
    @optional
    string default_source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Customer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Customer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified customer by setting the values of the parameters passed. Any
   * parameters not provided will be left unchanged. For example, if you pass the
   * <strong>source</strong> parameter, that becomes the customer’s active source (e.g., a card)
   * to be used for all charges in the future. When you update a customer to a new valid card source
   * by passing the <strong>source</strong> parameter: for each of the customer’s current
   * subscriptions, if the subscription bills automatically and is in the <code>past_due</code>
   * state, then the latest open invoice for the subscription with automatic collection enabled will
   * be retried. This retry will not count as an automatic retry, and will not affect the next
   * regularly scheduled payment for the invoice. Changing the <strong>default_source</strong> for a
   * customer will not trigger this behavior.</p>
   * <p>This request accepts mostly the same arguments as the customer creation call.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}`
   */
  void postCustomersCustomer(
      PostCustomersCustomerParams params,
      PostCustomersCustomerBody requestBody,
      PostCustomersCustomerResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteCustomersCustomerParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCustomersCustomerResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedCustomer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedCustomer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Permanently deletes a customer. It cannot be undone. Also immediately cancels any active
   * subscriptions on the customer.</p>
   * See_Also: HTTP DELETE `/v1/customers/{customer}`
   */
  void deleteCustomersCustomer(
      DeleteCustomersCustomerParams params,
      DeleteCustomersCustomerResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerFundingInstructionsParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerFundingInstructionsBody {
    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The `funding_type` to get the instructions for.
     */
    @optional
    string funding_type;

    static class BankTransferParams {
      @optional
      string type;

      @optional
      string[] requested_address_types;

      static class EuBankAccountParams {
        @optional
        string country;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      EuBankAccountParams eu_bank_transfer;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Additional parameters for `bank_transfer` funding types
     */
    @optional
    BankTransferParams bank_transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerFundingInstructionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FundingInstructions response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(FundingInstructions)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve funding instructions for a customer cash balance. If funding instructions do not
   * yet exist for the customer, new
   * funding instructions will be created. If funding instructions have already been created for a
   * given customer, the same
   * funding instructions will be retrieved. In other words, we will return the same funding
   * instructions each time.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/funding_instructions`
   */
  void postCustomersCustomerFundingInstructions(
      PostCustomersCustomerFundingInstructionsParams params,
      PostCustomersCustomerFundingInstructionsBody requestBody,
      PostCustomersCustomerFundingInstructionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/funding_instructions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerTaxIdsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerTaxIdsResponseHandler : ResponseHandler {

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      TaxId[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(TaxIDsList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TaxIDsList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of tax IDs for a customer.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/tax_ids`
   */
  void getCustomersCustomerTaxIds(
      GetCustomersCustomerTaxIdsParams params,
      GetCustomersCustomerTaxIdsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerTaxIdsParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerTaxIdsBody {
    /**
     * Type of the tax ID, one of `ae_trn`, `au_abn`, `au_arn`, `bg_uic`, `br_cnpj`, `br_cpf`,
     * `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `ch_vat`, `cl_tin`,
     * `eg_tin`, `es_cif`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `hk_br`, `hu_tin`, `id_npwp`,
     * `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kr_brn`, `li_uid`,
     * `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ph_tin`, `ru_inn`, `ru_kpp`,
     * `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `th_vat`, `tr_tin`, `tw_vat`, `ua_vat`, `us_ein`, or
     * `za_vat`
     */
    @optional
    string type;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Value of the tax ID.
     */
    @optional
    string value;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerTaxIdsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxId response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TaxId)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new <code>TaxID</code> object for a customer.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/tax_ids`
   */
  void postCustomersCustomerTaxIds(
      PostCustomersCustomerTaxIdsParams params,
      PostCustomersCustomerTaxIdsBody requestBody,
      PostCustomersCustomerTaxIdsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerBalanceTransactionsParams {
    /**
     */
    string customer;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCustomersCustomerBalanceTransactionsResponseHandler : ResponseHandler {

    static class CustomerBalanceTransactionList {
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
      CustomerBalanceTransaction[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransactionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerBalanceTransactionList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of transactions that updated the customer’s <a
   * href="/docs/billing/customer/balance">balances</a>.</p>
   * See_Also: HTTP GET `/v1/customers/{customer}/balance_transactions`
   */
  void getCustomersCustomerBalanceTransactions(
      GetCustomersCustomerBalanceTransactionsParams params,
      GetCustomersCustomerBalanceTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBalanceTransactionsParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBalanceTransactionsBody {
    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The integer amount in **cents (or local equivalent)** to apply to the customer's credit
     * balance.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Specifies the
     * [`invoice_credit_balance`](https://stripe.com/docs/api/customers/object#customer_object-invoi
     * ce_credit_balance) that this transaction will apply to. If the customer's `currency` is not
     * set, it will be updated to this value.
     */
    @optional
    string currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCustomersCustomerBalanceTransactionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CustomerBalanceTransaction)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates an immutable transaction that updates the customer’s credit <a
   * href="/docs/billing/customer/balance">balance</a>.</p>
   * See_Also: HTTP POST `/v1/customers/{customer}/balance_transactions`
   */
  void postCustomersCustomerBalanceTransactions(
      PostCustomersCustomerBalanceTransactionsParams params,
      PostCustomersCustomerBalanceTransactionsBody requestBody,
      PostCustomersCustomerBalanceTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
