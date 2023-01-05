// File automatically generated from OpenAPI spec.
module stripe.service.v1_topups_service;

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
public import stripe.model.topup : Topup;

/**
 * Service to make REST API calls to paths beginning with: /v1/topups
 */
class V1TopupsService {
  static class GetTopupsParams {
    /**
     * A positive integer representing how much to transfer.
     */
    Json amount;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
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
     * Only return top-ups that have the given status. One of `canceled`, `failed`, `pending` or
     * `succeeded`.
     */
    string status;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTopupsResponseHandler : ResponseHandler {

    static class TopupList {
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
      Topup[] data;

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
    void delegate(TopupList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TopupList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of top-ups.</p>
   * See_Also: HTTP GET `/v1/topups`
   */
  void getTopups(
      GetTopupsParams params,
      GetTopupsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/topups");
    if (!params.amount.isNull)
      requestor.setQueryParam!("deepObject")("amount", params.amount);
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTopupsBody {
    /**
     * A positive integer representing how much to transfer.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Extra information about a top-up for the source's bank statement. Limited to 15 ASCII
     * characters.
     */
    @optional
    string statement_descriptor;

    /**
     * A string that identifies this top-up as part of a group.
     */
    @optional
    string transfer_group;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * The ID of a source to transfer funds from. For most users, this should be left unspecified
     * which will use the bank account that was set up in the dashboard for the specified currency.
     * In test mode, this can be a test bank token (see [Testing
     * Top-ups](https://stripe.com/docs/connect/testing#testing-top-ups)).
     */
    @optional
    string source;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTopupsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Topup response) handleResponse200;

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
        handleResponse200(deserializeJson!(Topup)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Top up the balance of an account</p>
   * See_Also: HTTP POST `/v1/topups`
   */
  void postTopups(
      PostTopupsBody requestBody,
      PostTopupsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/topups");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTopupsTopupParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string topup;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTopupsTopupResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Topup response) handleResponse200;

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
        handleResponse200(deserializeJson!(Topup)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of a top-up that has previously been created. Supply the unique top-up
   * ID that was returned from your previous request, and Stripe will return the corresponding
   * top-up information.</p>
   * See_Also: HTTP GET `/v1/topups/{topup}`
   */
  void getTopupsTopup(
      GetTopupsTopupParams params,
      GetTopupsTopupResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/topups/{topup}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.topup.isNull)
      requestor.setPathParam("topup", params.topup);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTopupsTopupParams {
    /**
     */
    string topup;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTopupsTopupResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Topup response) handleResponse200;

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
        handleResponse200(deserializeJson!(Topup)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the metadata of a top-up. Other top-up details are not editable by design.</p>
   * See_Also: HTTP POST `/v1/topups/{topup}`
   */
  void postTopupsTopup(
      PostTopupsTopupParams params,
      PostTopupsTopupResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/topups/{topup}");
    if (!params.topup.isNull)
      requestor.setPathParam("topup", params.topup);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTopupsTopupCancelParams {
    /**
     */
    string topup;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTopupsTopupCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Topup response) handleResponse200;

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
        handleResponse200(deserializeJson!(Topup)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Cancels a top-up. Only pending top-ups can be canceled.</p>
   * See_Also: HTTP POST `/v1/topups/{topup}/cancel`
   */
  void postTopupsTopupCancel(
      PostTopupsTopupCancelParams params,
      PostTopupsTopupCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/topups/{topup}/cancel");
    if (!params.topup.isNull)
      requestor.setPathParam("topup", params.topup);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
