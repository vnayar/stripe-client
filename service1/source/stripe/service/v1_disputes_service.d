// File automatically generated from OpenAPI spec.
module stripe.service.v1_disputes_service;

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

public import stripe.model.dispute : Dispute;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/disputes
 */
class V1DisputesService {
  static class GetDisputesParams {
    /**
     * Only return disputes associated to the charge specified by this charge ID.
     */
    string charge;

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
     * Only return disputes associated to the PaymentIntent specified by this PaymentIntent ID.
     */
    string payment_intent;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetDisputesResponseHandler : ResponseHandler {

    static class DisputeList {
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
      Dispute[] data;

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
    void delegate(DisputeList response) handleResponse200;

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
        handleResponse200(deserializeJson!(DisputeList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your disputes.</p>
   * See_Also: HTTP GET `/v1/disputes`
   */
  void getDisputes(
      GetDisputesParams params,
      GetDisputesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/disputes");
    if (!params.charge.isNull)
      requestor.setQueryParam!("deepObject")("charge", params.charge);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.payment_intent.isNull)
      requestor.setQueryParam!("deepObject")("payment_intent", params.payment_intent);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostDisputesDisputeCloseParams {
    /**
     */
    string dispute;

    mixin AddBuilder!(typeof(this));

  }

  static class PostDisputesDisputeCloseBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostDisputesDisputeCloseResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Closing the dispute for a charge indicates that you do not have any evidence to submit and
   * are essentially dismissing the dispute, acknowledging it as lost.</p>
   * <p>The status of the dispute will change from <code>needs_response</code> to <code>lost</code>.
   * <em>Closing a dispute is irreversible</em>.</p>
   * See_Also: HTTP POST `/v1/disputes/{dispute}/close`
   */
  void postDisputesDisputeClose(
      PostDisputesDisputeCloseParams params,
      PostDisputesDisputeCloseBody requestBody,
      PostDisputesDisputeCloseResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/disputes/{dispute}/close");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetDisputesDisputeParams {
    /**
     */
    string dispute;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetDisputesDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the dispute with the given ID.</p>
   * See_Also: HTTP GET `/v1/disputes/{dispute}`
   */
  void getDisputesDispute(
      GetDisputesDisputeParams params,
      GetDisputesDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/disputes/{dispute}");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostDisputesDisputeParams {
    /**
     */
    string dispute;

    mixin AddBuilder!(typeof(this));

  }

  static class PostDisputesDisputeBody {
    static class DisputeEvidenceParams {
      @optional
      string customer_purchase_ip;

      @optional
      string customer_communication;

      @optional
      string shipping_date;

      @optional
      string shipping_tracking_number;

      @optional
      string shipping_carrier;

      @optional
      string refund_policy;

      @optional
      string shipping_address;

      @optional
      string service_documentation;

      @optional
      string refund_refusal_explanation;

      @optional
      string receipt;

      @optional
      string customer_email_address;

      @optional
      string cancellation_policy;

      @optional
      string product_description;

      @optional
      string duplicate_charge_documentation;

      @optional
      string uncategorized_file;

      @optional
      string shipping_documentation;

      @optional
      string service_date;

      @optional
      string billing_address;

      @optional
      string duplicate_charge_id;

      @optional
      string refund_policy_disclosure;

      @optional
      string customer_name;

      @optional
      string cancellation_policy_disclosure;

      @optional
      string uncategorized_text;

      @optional
      string cancellation_rebuttal;

      @optional
      string access_activity_log;

      @optional
      string duplicate_charge_explanation;

      @optional
      string customer_signature;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all
     * fields in the hash for review. The combined character count of all fields is limited to
     * 150,000.
     */
    @optional
    DisputeEvidenceParams evidence;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Whether to immediately submit evidence to the bank. If `false`, evidence is staged on the
     * dispute. Staged evidence is visible in the API and Dashboard, and can be submitted to the
     * bank by making another request with this attribute set to `true` (the default).
     */
    @optional
    Nullable!(bool) submit;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostDisputesDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When you get a dispute, contacting your customer is always the best first step. If that
   * doesn’t work, you can submit evidence to help us resolve the dispute in your favor. You can
   * do this in your <a href="https://dashboard.stripe.com/disputes">dashboard</a>, but if you
   * prefer, you can use the API to submit evidence programmatically.</p>
   * <p>Depending on your dispute type, different evidence fields will give you a better chance of
   * winning your dispute. To figure out which evidence fields to provide, see our <a
   * href="/docs/disputes/categories">guide to dispute types</a>.</p>
   * See_Also: HTTP POST `/v1/disputes/{dispute}`
   */
  void postDisputesDispute(
      PostDisputesDisputeParams params,
      PostDisputesDisputeBody requestBody,
      PostDisputesDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/disputes/{dispute}");
    if (!params.dispute.isNull)
      requestor.setPathParam("dispute", params.dispute);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
