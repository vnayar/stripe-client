// File automatically generated from OpenAPI spec.
module stripe.service.v1_sigma_scheduled_query_runs_service;

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

public import stripe.model.error : Error_;
public import stripe.model.scheduled_query_run : ScheduledQueryRun;

/**
 * Service to make REST API calls to paths beginning with: /v1/sigma/scheduled_query_runs
 */
class V1SigmaScheduledQueryRunsService {
  static class GetSigmaScheduledQueryRunsParams {
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

  }

  static class GetSigmaScheduledQueryRunsResponseHandler : ResponseHandler {

    static class SigmaScheduledQueryRunList {
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
      ScheduledQueryRun[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(SigmaScheduledQueryRunList response) handleResponse200;

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
        handleResponse200(deserializeJson!(SigmaScheduledQueryRunList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of scheduled query runs.</p>
   * See_Also: HTTP GET `/v1/sigma/scheduled_query_runs`
   */
  void getSigmaScheduledQueryRuns(
      GetSigmaScheduledQueryRunsParams params,
      GetSigmaScheduledQueryRunsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sigma/scheduled_query_runs");
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

  static class GetSigmaScheduledQueryRunsScheduledQueryRunParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string scheduled_query_run;

  }

  static class GetSigmaScheduledQueryRunsScheduledQueryRunResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ScheduledQueryRun response) handleResponse200;

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
        handleResponse200(deserializeJson!(ScheduledQueryRun)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of an scheduled query run.</p>
   * See_Also: HTTP GET `/v1/sigma/scheduled_query_runs/{scheduled_query_run}`
   */
  void getSigmaScheduledQueryRunsScheduledQueryRun(
      GetSigmaScheduledQueryRunsScheduledQueryRunParams params,
      GetSigmaScheduledQueryRunsScheduledQueryRunResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sigma/scheduled_query_runs/{scheduled_query_run}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.scheduled_query_run.isNull)
      requestor.setPathParam("scheduled_query_run", params.scheduled_query_run);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
