// File automatically generated from OpenAPI spec.
module stripe.service.v1_subscription_schedules_service;

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

public import stripe.model.error : Error_;
public import stripe.model.subscription_schedule : SubscriptionSchedule;

/**
 * Service to make REST API calls to paths beginning with: /v1/subscription_schedules
 */
class V1SubscriptionSchedulesService {
  static class GetSubscriptionSchedulesParams {
    /**
     * Only return subscription schedules that were created canceled the given date interval.
     */
    Json canceled_at;

    /**
     * Only return subscription schedules that completed during the given date interval.
     */
    Json completed_at;

    /**
     * Only return subscription schedules that were created during the given date interval.
     */
    Json created;

    /**
     * Only return subscription schedules for the given customer.
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
     * Only return subscription schedules that were released during the given date interval.
     */
    Json released_at;

    /**
     * Only return subscription schedules that have not started yet.
     */
    Nullable!(bool) scheduled;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSubscriptionSchedulesResponseHandler : ResponseHandler {

    static class SubscriptionSchedulesResourceScheduleList {
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
      SubscriptionSchedule[] data;

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
    void delegate(SubscriptionSchedulesResourceScheduleList response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedulesResourceScheduleList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the list of your subscription schedules.</p>
   * See_Also: HTTP GET `/v1/subscription_schedules`
   */
  void getSubscriptionSchedules(
      GetSubscriptionSchedulesParams params,
      GetSubscriptionSchedulesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscription_schedules");
    if (!params.canceled_at.isNull)
      requestor.setQueryParam!("deepObject")("canceled_at", params.canceled_at);
    if (!params.completed_at.isNull)
      requestor.setQueryParam!("deepObject")("completed_at", params.completed_at);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.released_at.isNull)
      requestor.setQueryParam!("deepObject")("released_at", params.released_at);
    if (!params.scheduled.isNull)
      requestor.setQueryParam!("deepObject")("scheduled", params.scheduled);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionSchedulesBody {
    static class PhaseConfigurationParams {
      @optional
      string proration_behavior;

      @optional
      string coupon;

      static class ConfigurationItemParams {
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

      @optional
      ConfigurationItemParams[] items;

      @optional
      string collection_method;

      static class SubscriptionSchedulesParam {
        @optional
        Nullable!(int) days_until_due;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SubscriptionSchedulesParam invoice_settings;

      @optional
      Nullable!(long) end_date;

      @optional
      string billing_cycle_anchor;

      @optional
      string currency;

      @optional
      Json default_tax_rates;

      @optional
      Nullable!(float) application_fee_percent;

      @optional
      Nullable!(long) trial_end;

      @optional
      Json billing_thresholds;

      @optional
      string[string] metadata;

      @optional
      string default_payment_method;

      @optional
      Nullable!(bool) trial;

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

      @optional
      AddInvoiceItemEntry[] add_invoice_items;

      @optional
      string description;

      static class TransferDataSpecs {
        @optional
        Nullable!(float) amount_percent;

        @optional
        string destination;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      TransferDataSpecs transfer_data;

      @optional
      string on_behalf_of;

      static class AutomaticTaxConfig {
        @optional
        Nullable!(bool) enabled;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AutomaticTaxConfig automatic_tax;

      @optional
      Nullable!(int) iterations;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * List representing phases of the subscription schedule. Each phase can be customized to have
     * different durations, plans, and coupons. If there are multiple phases, the `end_date` of one
     * phase will always equal the `start_date` of the next phase.
     */
    @optional
    PhaseConfigurationParams[] phases;

    /**
     * When the subscription schedule starts. We recommend using `now` so that it starts the
     * subscription immediately. You can also use a Unix timestamp to backdate the subscription so
     * that it starts on a past date, or set a future date for the subscription to start on.
     */
    @optional
    Json start_date;

    /**
     * Configures how the subscription schedule behaves when it ends. Possible values are `release`
     * or `cancel` with the default being `release`. `release` will end the subscription schedule
     * and keep the underlying subscription running.`cancel` will end the subscription schedule and
     * cancel the underlying subscription.
     */
    @optional
    string end_behavior;

    static class DefaultSettingsParams {
      @optional
      string collection_method;

      static class SubscriptionSchedulesParam {
        @optional
        Nullable!(int) days_until_due;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SubscriptionSchedulesParam invoice_settings;

      @optional
      string billing_cycle_anchor;

      @optional
      Nullable!(float) application_fee_percent;

      @optional
      Json billing_thresholds;

      @optional
      string default_payment_method;

      @optional
      string description;

      @optional
      Json transfer_data;

      @optional
      Json on_behalf_of;

      static class AutomaticTaxConfig {
        @optional
        Nullable!(bool) enabled;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AutomaticTaxConfig automatic_tax;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Object representing the subscription schedule's default settings.
     */
    @optional
    DefaultSettingsParams default_settings;

    /**
     * The identifier of the customer to create the subscription schedule for.
     */
    @optional
    string customer;

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

    /**
     * Migrate an existing subscription to be managed by a subscription schedule. If this parameter
     * is set, a subscription schedule will be created using the subscription's item(s), set to
     * auto-renew using the subscription's interval. When using this parameter, other parameters
     * (such as phase values) cannot be set. To create a subscription schedule with other
     * modifications, we recommend making two separate API calls.
     */
    @optional
    string from_subscription;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSubscriptionSchedulesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new subscription schedule object. Each customer can have up to 500 active or
   * scheduled subscriptions.</p>
   * See_Also: HTTP POST `/v1/subscription_schedules`
   */
  void postSubscriptionSchedules(
      PostSubscriptionSchedulesBody requestBody,
      PostSubscriptionSchedulesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSubscriptionSchedulesScheduleParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string schedule;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSubscriptionSchedulesScheduleResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing subscription schedule. You only need to supply the
   * unique subscription schedule identifier that was returned upon subscription schedule
   * creation.</p>
   * See_Also: HTTP GET `/v1/subscription_schedules/{schedule}`
   */
  void getSubscriptionSchedulesSchedule(
      GetSubscriptionSchedulesScheduleParams params,
      GetSubscriptionSchedulesScheduleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionSchedulesScheduleParams {
    /**
     */
    string schedule;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSubscriptionSchedulesScheduleBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * If the update changes the current phase, indicates whether the changes should be prorated.
     * The default value is `create_prorations`.
     */
    @optional
    string proration_behavior;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class PhaseConfigurationParams {
      @optional
      string proration_behavior;

      @optional
      Json start_date;

      @optional
      string coupon;

      static class ConfigurationItemParams {
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

      @optional
      ConfigurationItemParams[] items;

      @optional
      string collection_method;

      static class SubscriptionSchedulesParam {
        @optional
        Nullable!(int) days_until_due;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SubscriptionSchedulesParam invoice_settings;

      @optional
      Json end_date;

      @optional
      string billing_cycle_anchor;

      @optional
      Json default_tax_rates;

      @optional
      Nullable!(float) application_fee_percent;

      @optional
      Json trial_end;

      @optional
      Json billing_thresholds;

      @optional
      string[string] metadata;

      @optional
      string default_payment_method;

      @optional
      Nullable!(bool) trial;

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

      @optional
      AddInvoiceItemEntry[] add_invoice_items;

      @optional
      string description;

      static class TransferDataSpecs {
        @optional
        Nullable!(float) amount_percent;

        @optional
        string destination;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      TransferDataSpecs transfer_data;

      @optional
      string on_behalf_of;

      static class AutomaticTaxConfig {
        @optional
        Nullable!(bool) enabled;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AutomaticTaxConfig automatic_tax;

      @optional
      Nullable!(int) iterations;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * List representing phases of the subscription schedule. Each phase can be customized to have
     * different durations, plans, and coupons. If there are multiple phases, the `end_date` of one
     * phase will always equal the `start_date` of the next phase. Note that past phases can be
     * omitted.
     */
    @optional
    PhaseConfigurationParams[] phases;

    /**
     * Configures how the subscription schedule behaves when it ends. Possible values are `release`
     * or `cancel` with the default being `release`. `release` will end the subscription schedule
     * and keep the underlying subscription running.`cancel` will end the subscription schedule and
     * cancel the underlying subscription.
     */
    @optional
    string end_behavior;

    static class DefaultSettingsParams {
      @optional
      string collection_method;

      static class SubscriptionSchedulesParam {
        @optional
        Nullable!(int) days_until_due;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SubscriptionSchedulesParam invoice_settings;

      @optional
      string billing_cycle_anchor;

      @optional
      Nullable!(float) application_fee_percent;

      @optional
      Json billing_thresholds;

      @optional
      string default_payment_method;

      @optional
      string description;

      @optional
      Json transfer_data;

      @optional
      Json on_behalf_of;

      static class AutomaticTaxConfig {
        @optional
        Nullable!(bool) enabled;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AutomaticTaxConfig automatic_tax;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Object representing the subscription schedule's default settings.
     */
    @optional
    DefaultSettingsParams default_settings;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSubscriptionSchedulesScheduleResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing subscription schedule.</p>
   * See_Also: HTTP POST `/v1/subscription_schedules/{schedule}`
   */
  void postSubscriptionSchedulesSchedule(
      PostSubscriptionSchedulesScheduleParams params,
      PostSubscriptionSchedulesScheduleBody requestBody,
      PostSubscriptionSchedulesScheduleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}");
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostSubscriptionSchedulesScheduleCancelParams {
    /**
     */
    string schedule;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSubscriptionSchedulesScheduleCancelBody {
    /**
     * If the subscription schedule is `active`, indicates if the cancellation should be prorated.
     * Defaults to `true`.
     */
    @optional
    Nullable!(bool) prorate;

    /**
     * If the subscription schedule is `active`, indicates if a final invoice will be generated that
     * contains any un-invoiced metered usage and new/pending proration invoice items. Defaults to
     * `true`.
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

  static class PostSubscriptionSchedulesScheduleCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Cancels a subscription schedule and its associated subscription immediately (if the
   * subscription schedule has an active subscription). A subscription schedule can only be canceled
   * if its status is <code>not_started</code> or <code>active</code>.</p>
   * See_Also: HTTP POST `/v1/subscription_schedules/{schedule}/cancel`
   */
  void postSubscriptionSchedulesScheduleCancel(
      PostSubscriptionSchedulesScheduleCancelParams params,
      PostSubscriptionSchedulesScheduleCancelBody requestBody,
      PostSubscriptionSchedulesScheduleCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}/cancel");
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostSubscriptionSchedulesScheduleReleaseParams {
    /**
     */
    string schedule;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSubscriptionSchedulesScheduleReleaseBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Keep any cancellation on the subscription that the schedule has set
     */
    @optional
    Nullable!(bool) preserve_cancel_date;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSubscriptionSchedulesScheduleReleaseResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Releases the subscription schedule immediately, which will stop scheduling of its phases,
   * but leave any existing subscription in place. A schedule can only be released if its status is
   * <code>not_started</code> or <code>active</code>. If the subscription schedule is currently
   * associated with a subscription, releasing it will remove its <code>subscription</code> property
   * and set the subscription’s ID to the <code>released_subscription</code> property.</p>
   * See_Also: HTTP POST `/v1/subscription_schedules/{schedule}/release`
   */
  void postSubscriptionSchedulesScheduleRelease(
      PostSubscriptionSchedulesScheduleReleaseParams params,
      PostSubscriptionSchedulesScheduleReleaseBody requestBody,
      PostSubscriptionSchedulesScheduleReleaseResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}/release");
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
