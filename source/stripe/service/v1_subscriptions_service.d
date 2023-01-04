// File automatically generated from OpenAPI spec.
module stripe.service.v1_subscriptions_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.deleted_discount : DeletedDiscount;
public import stripe.model.error : Error_;
public import stripe.model.subscription : Subscription;

/**
 * Service to make REST API calls to paths beginning with: /v1/subscriptions
 */
class V1SubscriptionsService {
  static class GetSubscriptionsSubscriptionExposedIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string subscription_exposed_id;

  }

  static class GetSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the subscription with the given ID.</p>
   * See_Also: HTTP GET `/v1/subscriptions/{subscription_exposed_id}`
   */
  void getSubscriptionsSubscriptionExposedId(
      GetSubscriptionsSubscriptionExposedIdParams params,
      GetSubscriptionsSubscriptionExposedIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscriptions/{subscription_exposed_id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    string subscription_exposed_id;

  }

  static class PostSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates an existing subscription on a customer to match the specified parameters. When
   * changing plans or quantities, we will optionally prorate the price we charge next month to make
   * up for any price changes. To preview how the proration will be calculated, use the <a
   * href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>
   * See_Also: HTTP POST `/v1/subscriptions/{subscription_exposed_id}`
   */
  void postSubscriptionsSubscriptionExposedId(
      PostSubscriptionsSubscriptionExposedIdParams params,
      PostSubscriptionsSubscriptionExposedIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscriptions/{subscription_exposed_id}");
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    string subscription_exposed_id;

  }

  static class DeleteSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Cancels a customer’s subscription immediately. The customer will not be charged again for
   * the subscription.</p>
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
   * See_Also: HTTP DELETE `/v1/subscriptions/{subscription_exposed_id}`
   */
  void deleteSubscriptionsSubscriptionExposedId(
      DeleteSubscriptionsSubscriptionExposedIdParams params,
      DeleteSubscriptionsSubscriptionExposedIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/subscriptions/{subscription_exposed_id}");
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteSubscriptionsSubscriptionExposedIdDiscountParams {
    /**
     */
    string subscription_exposed_id;

  }

  static class DeleteSubscriptionsSubscriptionExposedIdDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedDiscount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedDiscount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Removes the currently applied discount on a subscription.</p>
   * See_Also: HTTP DELETE `/v1/subscriptions/{subscription_exposed_id}/discount`
   */
  void deleteSubscriptionsSubscriptionExposedIdDiscount(
      DeleteSubscriptionsSubscriptionExposedIdDiscountParams params,
      DeleteSubscriptionsSubscriptionExposedIdDiscountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/subscriptions/{subscription_exposed_id}/discount");
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetSubscriptionsParams {
    /**
     * The collection method of the subscriptions to retrieve. Either `charge_automatically` or
     * `send_invoice`.
     */
    string collection_method;

    /**
     */
    Json created;

    /**
     */
    Json current_period_end;

    /**
     */
    Json current_period_start;

    /**
     * The ID of the customer whose subscriptions will be retrieved.
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
     * Filter for subscriptions that contain this recurring price ID.
     */
    string price;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * The status of the subscriptions to retrieve. Passing in a value of `canceled` will return all
     * canceled subscriptions, including those belonging to deleted customers. Pass `ended` to find
     * subscriptions that are canceled and subscriptions that are expired due to [incomplete
     * payment](https://stripe.com/docs/billing/subscriptions/overview#subscription-statuses).
     * Passing in a value of `all` will return subscriptions of all statuses. If no value is
     * supplied, all subscriptions that have not been canceled are returned.
     */
    string status;

    /**
     * Filter for subscriptions that are associated with the specified test clock. The response will
     * not include subscriptions with test clocks if this and the customer parameter is not set.
     */
    string test_clock;

  }

  static class GetSubscriptionsResponseHandler : ResponseHandler {

    static class SubscriptionsSubscriptionList {
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
      Subscription[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(SubscriptionsSubscriptionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(SubscriptionsSubscriptionList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>By default, returns a list of subscriptions that have not been canceled. In order to list
   * canceled subscriptions, specify <code>status=canceled</code>.</p>
   * See_Also: HTTP GET `/v1/subscriptions`
   */
  void getSubscriptions(
      GetSubscriptionsParams params,
      GetSubscriptionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscriptions");
    if (!params.collection_method.isNull)
      requestor.setQueryParam!("deepObject")("collection_method", params.collection_method);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.current_period_end.isNull)
      requestor.setQueryParam!("deepObject")("current_period_end", params.current_period_end);
    if (!params.current_period_start.isNull)
      requestor.setQueryParam!("deepObject")("current_period_start", params.current_period_start);
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.price.isNull)
      requestor.setQueryParam!("deepObject")("price", params.price);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    if (!params.test_clock.isNull)
      requestor.setQueryParam!("deepObject")("test_clock", params.test_clock);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionsBody {
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
     * The account on behalf of which to charge, for each of the subscription's invoices.
     */
    @optional
    Json on_behalf_of;

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

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

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

    }

    /**
     * A list of up to 20 subscription items, each with an attached price.
     */
    @optional
    SubscriptionItemCreateParams[] items;

    /**
     * The identifier of the customer to subscribe.
     */
    @optional
    string customer;

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

      }

      @optional
      PaymentMethodOptions payment_method_options;

      @optional
      string save_default_payment_method;

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
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * A future timestamp to anchor the subscription's [billing
     * cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the
     * date of the first full invoice, and, for plans with `month` or `year` intervals, the day of
     * the month for subsequent invoices. The timestamp is in UTC format.
     */
    @optional
    Nullable!(long) billing_cycle_anchor;

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

      }

      @optional
      OneTimePriceData price_data;

      @optional
      Nullable!(int) quantity;

      @optional
      Json tax_rates;

      @optional
      string price;

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
     * Indicates if a customer is on or off-session while an invoice payment is attempted.
     */
    @optional
    Nullable!(bool) off_session;

    /**
     * The API ID of a promotion code to apply to this subscription. A promotion code applied to a
     * subscription will only affect invoices created for that particular subscription.
     */
    @optional
    string promotion_code;

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

    /**
     * The subscription's description, meant to be displayable to the customer. Use this field to
     * optionally store an explanation of the subscription for rendering in Stripe surfaces.
     */
    @optional
    string description;

    static class AutomaticTaxConfig {
      @optional
      Nullable!(bool) enabled;

    }

    /**
     * Automatic tax settings for this subscription. We recommend you only include this parameter
     * when the existing value is being changed.
     */
    @optional
    AutomaticTaxConfig automatic_tax;

  }

  static class PostSubscriptionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a new subscription on an existing customer. Each customer can have up to 500 active
   * or scheduled subscriptions.</p>
   * <p>When you create a subscription with <code>collection_method=charge_automatically</code>, the
   * first invoice is finalized as part of the request.
   * The <code>payment_behavior</code> parameter determines the exact behavior of the initial
   * payment.</p>
   * <p>To start subscriptions where the first invoice always begins in a <code>draft</code> status,
   * use <a href="/docs/billing/subscriptions/subscription-schedules#managing">subscription
   * schedules</a> instead.
   * Schedules provide the flexibility to model more complex billing configurations that change over
   * time.</p>
   * See_Also: HTTP POST `/v1/subscriptions`
   */
  void postSubscriptions(
      PostSubscriptionsBody requestBody,
      PostSubscriptionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscriptions");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
