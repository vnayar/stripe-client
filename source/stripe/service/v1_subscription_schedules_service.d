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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(SubscriptionSchedulesResourceScheduleList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostSubscriptionSchedulesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new subscription schedule object. Each customer can have up to 500 active or
   * scheduled subscriptions.</p>
   * See_Also: HTTP POST `/v1/subscription_schedules`
   */
  void postSubscriptionSchedules(
      PostSubscriptionSchedulesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostSubscriptionSchedulesScheduleResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SubscriptionSchedule response) handleResponse200;

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
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing subscription schedule.</p>
   * See_Also: HTTP POST `/v1/subscription_schedules/{schedule}`
   */
  void postSubscriptionSchedulesSchedule(
      PostSubscriptionSchedulesScheduleParams params,
      PostSubscriptionSchedulesScheduleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}");
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionSchedulesScheduleCancelParams {
    /**
     */
    string schedule;

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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
      PostSubscriptionSchedulesScheduleCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}/cancel");
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSubscriptionSchedulesScheduleReleaseParams {
    /**
     */
    string schedule;

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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(SubscriptionSchedule)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
      PostSubscriptionSchedulesScheduleReleaseResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/subscription_schedules/{schedule}/release");
    if (!params.schedule.isNull)
      requestor.setPathParam("schedule", params.schedule);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
