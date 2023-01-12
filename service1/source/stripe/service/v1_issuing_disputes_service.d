// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_disputes_service;

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

    mixin AddBuilder!(typeof(this));

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(IssuingDisputeList response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDisputeList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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

  static class PostIssuingDisputesBody {
    static class EvidenceParam {
      @optional
      Json canceled;

      @optional
      string reason;

      @optional
      Json merchandise_not_as_described;

      @optional
      Json other;

      @optional
      Json service_not_as_described;

      @optional
      Json fraudulent;

      @optional
      Json duplicate;

      @optional
      Json not_received;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Evidence provided for the dispute.
     */
    @optional
    EvidenceParam evidence;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * The dispute amount in the card's currency and in the [smallest currency
     * unit](https://stripe.com/docs/currencies#zero-decimal). If not set, defaults to the full
     * transaction amount.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The ID of the issuing transaction to create a dispute for. For transaction on Treasury
     * FinancialAccounts, use `treasury.received_debit`.
     */
    @optional
    string transaction;

    static class TreasuryParam {
      @optional
      string received_debit;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Params for disputes related to Treasury FinancialAccounts
     */
    @optional
    TreasuryParam treasury;

    mixin AddBuilder!(typeof(this));

  }

  static class PostIssuingDisputesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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
      PostIssuingDisputesBody requestBody,
      PostIssuingDisputesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/disputes");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetIssuingDisputesDisputeParams {
    /**
     */
    string dispute;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetIssuingDisputesDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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

    mixin AddBuilder!(typeof(this));

  }

  static class PostIssuingDisputesDisputeBody {
    static class EvidenceParam {
      @optional
      Json canceled;

      @optional
      string reason;

      @optional
      Json merchandise_not_as_described;

      @optional
      Json other;

      @optional
      Json service_not_as_described;

      @optional
      Json fraudulent;

      @optional
      Json duplicate;

      @optional
      Json not_received;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Evidence provided for the dispute.
     */
    @optional
    EvidenceParam evidence;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The dispute amount in the card's currency and in the [smallest currency
     * unit](https://stripe.com/docs/currencies#zero-decimal).
     */
    @optional
    Nullable!(int) amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostIssuingDisputesDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified Issuing <code>Dispute</code> object by setting the values of the
   * parameters passed. Any parameters not provided will be left unchanged. Properties on the
   * <code>evidence</code> object can be unset by passing in an empty string.</p>
   * See_Also: HTTP POST `/v1/issuing/disputes/{dispute}`
   */
  void postIssuingDisputesDispute(
      PostIssuingDisputesDisputeParams params,
      PostIssuingDisputesDisputeBody requestBody,
      PostIssuingDisputesDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/disputes/{dispute}");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostIssuingDisputesDisputeSubmitParams {
    /**
     */
    string dispute;

    mixin AddBuilder!(typeof(this));

  }

  static class PostIssuingDisputesDisputeSubmitBody {
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

    mixin AddBuilder!(typeof(this));

  }

  static class PostIssuingDisputesDisputeSubmitResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingDispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingDispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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
      PostIssuingDisputesDisputeSubmitBody requestBody,
      PostIssuingDisputesDisputeSubmitResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/disputes/{dispute}/submit");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
