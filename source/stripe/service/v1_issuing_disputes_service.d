// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_disputes_service;

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
public import stripe.model.issuing.dispute : IssuingDispute;

/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/disputes
 */
class V1IssuingDisputesService {
  static class GetIssuingDisputesParams {
    /**
     * Select Issuing disputes that were created during the given date interval.
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

    /**
     * Select Issuing disputes with the given status.
     */
    string status;

    /**
     * Select the Issuing dispute for the given transaction.
     */
    string transaction;

  }

  static class GetIssuingDisputesResponseHandler : ResponseHandler {

    static class IssuingDisputeList {
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
      IssuingDispute[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(IssuingDisputeList response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDisputeList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of Issuing <code>Dispute</code> objects. The objects are sorted in descending
   * order by creation date, with the most recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/issuing/disputes`
   */
  void getIssuingDisputes(
      GetIssuingDisputesParams params,
      GetIssuingDisputesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/disputes");
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
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    if (!params.transaction.isNull)
      requestor.setQueryParam!("deepObject")("transaction", params.transaction);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingDisputesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates an Issuing <code>Dispute</code> object. Individual pieces of evidence within the
   * <code>evidence</code> object are optional at this point. Stripe only validates that required
   * evidence is present during submission. Refer to <a
   * href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and
   * evidence</a> for more details about evidence requirements.</p>
   * See_Also: HTTP POST `/v1/issuing/disputes`
   */
  void postIssuingDisputes(
      PostIssuingDisputesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/disputes");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingDisputesDisputeParams {
    /**
     */
    string dispute;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

  }

  static class GetIssuingDisputesDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves an Issuing <code>Dispute</code> object.</p>
   * See_Also: HTTP GET `/v1/issuing/disputes/{dispute}`
   */
  void getIssuingDisputesDispute(
      GetIssuingDisputesDisputeParams params,
      GetIssuingDisputesDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/disputes/{dispute}");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingDisputesDisputeParams {
    /**
     */
    string dispute;

  }

  static class PostIssuingDisputesDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the specified Issuing <code>Dispute</code> object by setting the values of the
   * parameters passed. Any parameters not provided will be left unchanged. Properties on the
   * <code>evidence</code> object can be unset by passing in an empty string.</p>
   * See_Also: HTTP POST `/v1/issuing/disputes/{dispute}`
   */
  void postIssuingDisputesDispute(
      PostIssuingDisputesDisputeParams params,
      PostIssuingDisputesDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/disputes/{dispute}");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingDisputesDisputeSubmitParams {
    /**
     */
    string dispute;

  }

  static class PostIssuingDisputesDisputeSubmitResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Submits an Issuing <code>Dispute</code> to the card network. Stripe validates that all
   * evidence fields required for the dispute’s reason are present. For more details, see <a
   * href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and
   * evidence</a>.</p>
   * See_Also: HTTP POST `/v1/issuing/disputes/{dispute}/submit`
   */
  void postIssuingDisputesDisputeSubmit(
      PostIssuingDisputesDisputeSubmitParams params,
      PostIssuingDisputesDisputeSubmitResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/disputes/{dispute}/submit");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
