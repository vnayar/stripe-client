// File automatically generated from OpenAPI spec.
module stripe.service.v1_reporting_report_runs_service;

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
public import stripe.model.reporting.report_run : ReportingReportRun;

/**
 * Service to make REST API calls to paths beginning with: /v1/reporting/report_runs
 */
class V1ReportingReportRunsService {
  static class GetReportingReportRunsReportRunParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string report_run;

    mixin AddBuilder!(typeof(this));

  }

  static class GetReportingReportRunsReportRunResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ReportingReportRun response) handleResponse200;

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
        handleResponse200(deserializeJson!(ReportingReportRun)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing Report Run.</p>
   * See_Also: HTTP GET `/v1/reporting/report_runs/{report_run}`
   */
  void getReportingReportRunsReportRun(
      GetReportingReportRunsReportRunParams params,
      GetReportingReportRunsReportRunResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/reporting/report_runs/{report_run}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.report_run.isNull)
      requestor.setPathParam("report_run", params.report_run);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetReportingReportRunsParams {
    /**
     */
    Json created;

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

  static class GetReportingReportRunsResponseHandler : ResponseHandler {

    static class FinancialReportingFinanceReportRunList {
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
      ReportingReportRun[] data;

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
    void delegate(FinancialReportingFinanceReportRunList response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialReportingFinanceReportRunList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of Report Runs, with the most recent appearing first.</p>
   * See_Also: HTTP GET `/v1/reporting/report_runs`
   */
  void getReportingReportRuns(
      GetReportingReportRunsParams params,
      GetReportingReportRunsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/reporting/report_runs");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
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

  static class PostReportingReportRunsBody {
    /**
     * The ID of the [report type](https://stripe.com/docs/reporting/statements/api#report-types) to
     * run, such as `"balance.summary.1"`.
     */
    @optional
    string report_type;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class RunParameterSpecs {
      @optional
      string connected_account;

      @optional
      string reporting_category;

      @optional
      Nullable!(long) interval_start;

      @optional
      string currency;

      @optional
      string timezone;

      @optional
      string[] columns;

      @optional
      Nullable!(long) interval_end;

      @optional
      string payout;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Parameters specifying how the report should be run. Different Report Types have different
     * required and optional parameters, listed in the [API Access to
     * Reports](https://stripe.com/docs/reporting/statements/api) documentation.
     */
    @optional
    RunParameterSpecs parameters;

    mixin AddBuilder!(typeof(this));

  }

  static class PostReportingReportRunsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ReportingReportRun response) handleResponse200;

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
        handleResponse200(deserializeJson!(ReportingReportRun)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new object and begin running the report. (Certain report types require a <a
   * href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>
   * See_Also: HTTP POST `/v1/reporting/report_runs`
   */
  void postReportingReportRuns(
      PostReportingReportRunsBody requestBody,
      PostReportingReportRunsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/reporting/report_runs");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
