// File automatically generated from OpenAPI spec.
module stripe.service.v1_identity_verification_reports_service;

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
public import stripe.model.identity.verification_report : IdentityVerificationReport;
/**
 * Service to make REST API calls to paths beginning with: /v1/identity/verification_reports
 */
class V1IdentityVerificationReportsService {
  static class GetIdentityVerificationReportsParams {
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

    /**
     * Only return VerificationReports of this type
     */
    Nullable!(Nullable!(string)) type;

    /**
     * Only return VerificationReports created by this VerificationSession ID. It is allowed to
     * provide a VerificationIntent ID.
     */
    Nullable!(Nullable!(string)) verification_session;

  }

  static class GetIdentityVerificationReportsResponseHandler : ResponseHandler {

    static class GelatoVerificationReportList {
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
      IdentityVerificationReport[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(GelatoVerificationReportList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(GelatoVerificationReportList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIdentityVerificationReports(
      GetIdentityVerificationReportsParams params,
      GetIdentityVerificationReportsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/identity/verification_reports");
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
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    if (!params.verification_session.isNull)
      requestor.setQueryParam("verification_session", params.verification_session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIdentityVerificationReportsReportParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) report;

  }

  static class GetIdentityVerificationReportsReportResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IdentityVerificationReport response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IdentityVerificationReport)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIdentityVerificationReportsReport(
      GetIdentityVerificationReportsReportParams params,
      GetIdentityVerificationReportsReportResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/identity/verification_reports/{report}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.report.isNull)
      requestor.setPathParam("report", params.report.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
