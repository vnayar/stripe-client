// File automatically generated from OpenAPI spec.
module stripe.service.v1_subscription_items_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.deleted_subscription_item : DeletedSubscriptionItem;
public import stripe.model.error : Error_;
public import stripe.model.subscription_item : SubscriptionItem;
public import stripe.model.usage_record : UsageRecord;
public import stripe.model.usage_record_summary : UsageRecordSummary;

/**
 * Service to make REST API calls to paths beginning with: /v1/subscription_items
 */
class V1SubscriptionItemsService {
  static class GetSubscriptionItemsItemParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) item;

  }

  static class GetSubscriptionItemsItemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SubscriptionItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the subscription item with the given ID.</p>
   * See_Also: HTTP GET `/v1/subscription_items/{item}`
   */
  void getSubscriptionItemsItem(
      GetSubscriptionItemsItemParams params,
      GetSubscriptionItemsItemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscription_items/{item}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.item.isNull)
      requestor.setPathParam("item", params.item.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionItemsItemParams {
    /**
     */
    Nullable!(Nullable!(string)) item;

  }

  static class PostSubscriptionItemsItemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SubscriptionItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the plan or quantity of an item on a current subscription.</p>
   * See_Also: HTTP POST `/v1/subscription_items/{item}`
   */
  void postSubscriptionItemsItem(
      PostSubscriptionItemsItemParams params,
      PostSubscriptionItemsItemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_items/{item}");
    if (!params.item.isNull)
      requestor.setPathParam("item", params.item.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteSubscriptionItemsItemParams {
    /**
     */
    Nullable!(Nullable!(string)) item;

  }

  static class DeleteSubscriptionItemsItemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedSubscriptionItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedSubscriptionItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Deletes an item from the subscription. Removing a subscription item from a subscription will
   * not cancel the subscription.</p>
   * See_Also: HTTP DELETE `/v1/subscription_items/{item}`
   */
  void deleteSubscriptionItemsItem(
      DeleteSubscriptionItemsItemParams params,
      DeleteSubscriptionItemsItemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/subscription_items/{item}");
    if (!params.item.isNull)
      requestor.setPathParam("item", params.item.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionItemsSubscriptionItemUsageRecordsParams {
    /**
     */
    Nullable!(Nullable!(string)) subscription_item;

  }

  static class PostSubscriptionItemsSubscriptionItemUsageRecordsBody {
    /**
     * The timestamp for the usage event. This timestamp must be within the current billing period
     * of the subscription of the provided `subscription_item`, and must not be in the future. When
     * passing `"now"`, Stripe records usage for the current time. Default is `"now"` if a value is
     * not provided.
     */
    @optional
    Json timestamp;

    /**
     * Valid values are `increment` (default) or `set`. When using `increment` the specified
     * `quantity` will be added to the usage at the specified timestamp. The `set` action will
     * overwrite the usage quantity at that timestamp. If the subscription has [billing
     * thresholds](https://stripe.com/docs/api/subscriptions/object#subscription_object-billing_thre
     * sholds), `increment` is the only allowed value.
     */
    @optional
    Nullable!(string) action;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The usage quantity for the specified timestamp.
     */
    @optional
    Nullable!(int) quantity;

  }

  static class PostSubscriptionItemsSubscriptionItemUsageRecordsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(UsageRecord response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(UsageRecord)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a usage record for a specified subscription item and date, and fills it with a
   * quantity.</p>
   * <p>Usage records provide <code>quantity</code> information that Stripe uses to track how much a
   * customer is using your service. With usage information and the pricing model set up by the <a
   * href="https://stripe.com/docs/billing/subscriptions/metered-billing">metered billing</a> plan,
   * Stripe helps you send accurate invoices to your customers.</p>
   * <p>The default calculation for usage is to add up all the <code>quantity</code> values of the
   * usage records within a billing period. You can change this default behavior with the billing
   * plan’s <code>aggregate_usage</code> <a
   * href="/docs/api/plans/create#create_plan-aggregate_usage">parameter</a>. When there is more
   * than one usage record with the same timestamp, Stripe adds the <code>quantity</code> values
   * together. In most cases, this is the desired resolution, however, you can change this behavior
   * with the <code>action</code> parameter.</p>
   * <p>The default pricing model for metered billing is <a
   * href="/docs/api/plans/object#plan_object-billing_scheme">per-unit pricing</a>. For finer
   * granularity, you can configure metered billing to have a <a
   * href="https://stripe.com/docs/billing/subscriptions/tiers">tiered pricing</a> model.</p>
   * See_Also: HTTP POST `/v1/subscription_items/{subscription_item}/usage_records`
   */
  void postSubscriptionItemsSubscriptionItemUsageRecords(
      PostSubscriptionItemsSubscriptionItemUsageRecordsParams params,
      PostSubscriptionItemsSubscriptionItemUsageRecordsBody requestBody,
      PostSubscriptionItemsSubscriptionItemUsageRecordsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_items/{subscription_item}/usage_records");
    if (!params.subscription_item.isNull)
      requestor.setPathParam("subscription_item", params.subscription_item.get.to!string);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSubscriptionItemsParams {
    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * The ID of the subscription whose items will be retrieved.
     */
    Nullable!(Nullable!(string)) subscription;

  }

  static class GetSubscriptionItemsResponseHandler : ResponseHandler {

    static class SubscriptionsItemsSubscriptionItemList {
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

      @optional
      SubscriptionItem[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(SubscriptionsItemsSubscriptionItemList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SubscriptionsItemsSubscriptionItemList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of your subscription items for a given subscription.</p>
   * See_Also: HTTP GET `/v1/subscription_items`
   */
  void getSubscriptionItems(
      GetSubscriptionItemsParams params,
      GetSubscriptionItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscription_items");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.subscription.isNull)
      requestor.setQueryParam("subscription", params.subscription.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionItemsBody {
    /**
     * Determines how to handle
     * [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing
     * cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting
     * a trial), or if an item's `quantity` changes.
     */
    @optional
    Nullable!(string) proration_behavior;

    /**
     * The identifier of the subscription to modify.
     */
    @optional
    Nullable!(string) subscription;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * The quantity you'd like to apply to the subscription item you're creating.
     */
    @optional
    Nullable!(int) quantity;

    /**
     * Define thresholds at which an invoice will be sent, and the subscription advanced to a new
     * billing period. When updating, pass an empty string to remove previously-defined thresholds.
     */
    @optional
    Json billing_thresholds;

    static class RecurringPriceData {
      @optional
      Nullable!(string) currency;

      @optional
      Nullable!(string) unit_amount_decimal;

      static class RecurringAdhoc {
        @optional
        Nullable!(int) interval_count;

        @optional
        Nullable!(string) interval;

      }

      @optional
      RecurringAdhoc recurring;

      @optional
      Nullable!(string) product;

      @optional
      Nullable!(string) tax_behavior;

      @optional
      Nullable!(int) unit_amount;

    }

    /**
     * Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
     */
    @optional
    RecurringPriceData price_data;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

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
    Nullable!(string) payment_behavior;

    /**
     * If set, the proration will be calculated as though the subscription was updated at the given
     * time. This can be used to apply the same proration that was previewed with the [upcoming
     * invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint.
     */
    @optional
    Nullable!(long) proration_date;

    /**
     * A list of [Tax Rate](https://stripe.com/docs/api/tax_rates) ids. These Tax Rates will
     * override the
     * [`default_tax_rates`](https://stripe.com/docs/api/subscriptions/create#create_subscription-de
     * fault_tax_rates) on the Subscription. When updating, pass an empty string to remove
     * previously-defined tax rates.
     */
    @optional
    Json tax_rates;

    /**
     * The ID of the price object.
     */
    @optional
    Nullable!(string) price;

  }

  static class PostSubscriptionItemsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SubscriptionItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Adds a new item to an existing subscription. No existing items will be changed or
   * replaced.</p>
   * See_Also: HTTP POST `/v1/subscription_items`
   */
  void postSubscriptionItems(
      PostSubscriptionItemsBody requestBody,
      PostSubscriptionItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_items");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams {
    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     */
    Nullable!(Nullable!(string)) subscription_item;

  }

  static class GetSubscriptionItemsSubscriptionItemUsageRecordSummariesResponseHandler : ResponseHandler {

    static class UsageEventsResourceUsageRecordSummaryList {
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

      @optional
      UsageRecordSummary[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(UsageEventsResourceUsageRecordSummaryList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(UsageEventsResourceUsageRecordSummaryList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>For the specified subscription item, returns a list of summary objects. Each object in the
   * list provides usage information that’s been summarized from multiple usage records and over a
   * subscription billing period (e.g., 15 usage records in the month of September).</p>
   * <p>The list is sorted in reverse-chronological order (newest first). The first list item
   * represents the most current usage period that hasn’t ended yet. Since new usage records can
   * still be added, the returned summary information for the subscription item’s ID should be
   * seen as unstable until the subscription billing period ends.</p>
   * See_Also: HTTP GET `/v1/subscription_items/{subscription_item}/usage_record_summaries`
   */
  void getSubscriptionItemsSubscriptionItemUsageRecordSummaries(
      GetSubscriptionItemsSubscriptionItemUsageRecordSummariesParams params,
      GetSubscriptionItemsSubscriptionItemUsageRecordSummariesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscription_items/{subscription_item}/usage_record_summaries");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.subscription_item.isNull)
      requestor.setPathParam("subscription_item", params.subscription_item.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
