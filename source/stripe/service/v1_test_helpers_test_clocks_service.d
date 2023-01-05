// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_test_clocks_service;

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

public import stripe.model.deleted_test_helpers.test_clock : DeletedTestHelpersTestClock;
public import stripe.model.error : Error_;
public import stripe.model.test_helpers.test_clock : TestHelpersTestClock;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/test_clocks
 */
class V1TestHelpersTestClocksService {
  static class PostTestHelpersTestClocksTestClockAdvanceParams {
    /**
     */
    string test_clock;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTestClocksTestClockAdvanceBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The time to advance the test clock. Must be after the test clock's current frozen time.
     * Cannot be more than two intervals in the future from the shortest subscription in this test
     * clock. If there are no subscriptions in this test clock, it cannot be more than two years in
     * the future.
     */
    @optional
    Nullable!(long) frozen_time;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTestClocksTestClockAdvanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TestHelpersTestClock response) handleResponse200;

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
        handleResponse200(deserializeJson!(TestHelpersTestClock)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Starts advancing a test clock to a specified time in the future. Advancement is done when
   * status changes to <code>Ready</code>.</p>
   * See_Also: HTTP POST `/v1/test_helpers/test_clocks/{test_clock}/advance`
   */
  void postTestHelpersTestClocksTestClockAdvance(
      PostTestHelpersTestClocksTestClockAdvanceParams params,
      PostTestHelpersTestClocksTestClockAdvanceBody requestBody,
      PostTestHelpersTestClocksTestClockAdvanceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/test_clocks/{test_clock}/advance");
    if (!params.test_clock.isNull)
      requestor.setPathParam("test_clock", params.test_clock);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTestHelpersTestClocksParams {
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

  static class GetTestHelpersTestClocksResponseHandler : ResponseHandler {

    static class BillingClocksResourceBillingClockList {
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
      TestHelpersTestClock[] data;

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
    void delegate(BillingClocksResourceBillingClockList response) handleResponse200;

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
        handleResponse200(deserializeJson!(BillingClocksResourceBillingClockList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your test clocks.</p>
   * See_Also: HTTP GET `/v1/test_helpers/test_clocks`
   */
  void getTestHelpersTestClocks(
      GetTestHelpersTestClocksParams params,
      GetTestHelpersTestClocksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/test_helpers/test_clocks");
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

  static class PostTestHelpersTestClocksBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The initial frozen time for this test clock.
     */
    @optional
    Nullable!(long) frozen_time;

    /**
     * The name for this test clock.
     */
    @optional
    string name;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTestClocksResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TestHelpersTestClock response) handleResponse200;

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
        handleResponse200(deserializeJson!(TestHelpersTestClock)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new test clock that can be attached to new customers and quotes.</p>
   * See_Also: HTTP POST `/v1/test_helpers/test_clocks`
   */
  void postTestHelpersTestClocks(
      PostTestHelpersTestClocksBody requestBody,
      PostTestHelpersTestClocksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/test_clocks");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTestHelpersTestClocksTestClockParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string test_clock;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTestHelpersTestClocksTestClockResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TestHelpersTestClock response) handleResponse200;

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
        handleResponse200(deserializeJson!(TestHelpersTestClock)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a test clock.</p>
   * See_Also: HTTP GET `/v1/test_helpers/test_clocks/{test_clock}`
   */
  void getTestHelpersTestClocksTestClock(
      GetTestHelpersTestClocksTestClockParams params,
      GetTestHelpersTestClocksTestClockResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/test_helpers/test_clocks/{test_clock}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.test_clock.isNull)
      requestor.setPathParam("test_clock", params.test_clock);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteTestHelpersTestClocksTestClockParams {
    /**
     */
    string test_clock;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteTestHelpersTestClocksTestClockResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedTestHelpersTestClock response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedTestHelpersTestClock)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Deletes a test clock.</p>
   * See_Also: HTTP DELETE `/v1/test_helpers/test_clocks/{test_clock}`
   */
  void deleteTestHelpersTestClocksTestClock(
      DeleteTestHelpersTestClocksTestClockParams params,
      DeleteTestHelpersTestClocksTestClockResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/test_helpers/test_clocks/{test_clock}");
    if (!params.test_clock.isNull)
      requestor.setPathParam("test_clock", params.test_clock);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
