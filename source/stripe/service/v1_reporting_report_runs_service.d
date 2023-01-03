// File automatically generated from OpenAPI spec.
module stripe.service.v1_reporting_report_runs_service;

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
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) report_run;

  }

  static class GetReportingReportRunsReportRunResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ReportingReportRun response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(ReportingReportRun)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.report_run.isNull)
      requestor.setPathParam("report_run", params.report_run.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetReportingReportRunsParams {
    /**
     */
    Nullable!(Json) created;

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
      Nullable!(string) object;

      @optional
      ReportingReportRun[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(FinancialReportingFinanceReportRunList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(FinancialReportingFinanceReportRunList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostReportingReportRunsBody {
    /**
     * The ID of the [report type](https://stripe.com/docs/reporting/statements/api#report-types) to
     * run, such as `"balance.summary.1"`.
     */
    @optional
    Nullable!(string) report_type;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    static class RunParameterSpecs {
      @optional
      Nullable!(string) connected_account;

      @optional
      Nullable!(string) reporting_category;

      @optional
      Nullable!(long) interval_start;

      @optional
      Nullable!(string) currency;

      @optional
      Nullable!(string) timezone;

      @optional
      Nullable!(string)[] columns;

      @optional
      Nullable!(long) interval_end;

      @optional
      Nullable!(string) payout;

    }

    /**
     * Parameters specifying how the report should be run. Different Report Types have different
     * required and optional parameters, listed in the [API Access to
     * Reports](https://stripe.com/docs/reporting/statements/api) documentation.
     */
    @optional
    RunParameterSpecs parameters;

  }

  static class PostReportingReportRunsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ReportingReportRun response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(ReportingReportRun)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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

}
