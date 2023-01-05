// File automatically generated from OpenAPI spec.
module stripe.service.v1_sources_service;

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
public import stripe.model.source : Source;
public import stripe.model.source_mandate_notification : SourceMandateNotification;
public import stripe.model.source_transaction : SourceTransaction;

/**
 * Service to make REST API calls to paths beginning with: /v1/sources
 */
class V1SourcesService {
  static class GetSourcesSourceMandateNotificationsMandateNotificationParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string mandate_notification;

    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceMandateNotificationsMandateNotificationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SourceMandateNotification response) handleResponse200;

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
        handleResponse200(deserializeJson!(SourceMandateNotification)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a new Source MandateNotification.</p>
   * See_Also: HTTP GET `/v1/sources/{source}/mandate_notifications/{mandate_notification}`
   */
  void getSourcesSourceMandateNotificationsMandateNotification(
      GetSourcesSourceMandateNotificationsMandateNotificationParams params,
      GetSourcesSourceMandateNotificationsMandateNotificationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/mandate_notifications/{mandate_notification}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.mandate_notification.isNull)
      requestor.setPathParam("mandate_notification", params.mandate_notification);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new source object.</p>
   * See_Also: HTTP POST `/v1/sources`
   */
  void postSources(
      PostSourcesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetSourcesSourceParams {
    /**
     * The client secret of the source. Required if a publishable key is used to retrieve the
     * source.
     */
    string client_secret;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves an existing source object. Supply the unique source ID from a source creation
   * request and Stripe will return the corresponding up-to-date source object information.</p>
   * See_Also: HTTP GET `/v1/sources/{source}`
   */
  void getSourcesSource(
      GetSourcesSourceParams params,
      GetSourcesSourceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam!("deepObject")("client_secret", params.client_secret);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesSourceParams {
    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified source by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged.</p>
   * <p>This request accepts the <code>metadata</code> and <code>owner</code> as arguments. It is
   * also possible to update type specific information for selected payment methods. Please refer to
   * our <a href="/docs/sources">payment method guides</a> for more detail.</p>
   * See_Also: HTTP POST `/v1/sources/{source}`
   */
  void postSourcesSource(
      PostSourcesSourceParams params,
      PostSourcesSourceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources/{source}");
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetSourcesSourceSourceTransactionsParams {
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
     */
    string source;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceSourceTransactionsResponseHandler : ResponseHandler {

    static class ApmsSourcesSourceTransactionList {
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
      SourceTransaction[] data;

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
    void delegate(ApmsSourcesSourceTransactionList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApmsSourcesSourceTransactionList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>List source transactions for a given source.</p>
   * See_Also: HTTP GET `/v1/sources/{source}/source_transactions`
   */
  void getSourcesSourceSourceTransactions(
      GetSourcesSourceSourceTransactionsParams params,
      GetSourcesSourceSourceTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/source_transactions");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesSourceVerifyParams {
    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceVerifyBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The values needed to verify the source.
     */
    @optional
    string[] values;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceVerifyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Verify a given source.</p>
   * See_Also: HTTP POST `/v1/sources/{source}/verify`
   */
  void postSourcesSourceVerify(
      PostSourcesSourceVerifyParams params,
      PostSourcesSourceVerifyBody requestBody,
      PostSourcesSourceVerifyResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources/{source}/verify");
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSourcesSourceSourceTransactionsSourceTransactionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string source;

    /**
     */
    string source_transaction;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceSourceTransactionsSourceTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SourceTransaction response) handleResponse200;

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
        handleResponse200(deserializeJson!(SourceTransaction)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve an existing source transaction object. Supply the unique source ID from a source
   * creation request and the source transaction ID and Stripe will return the corresponding
   * up-to-date source object information.</p>
   * See_Also: HTTP GET `/v1/sources/{source}/source_transactions/{source_transaction}`
   */
  void getSourcesSourceSourceTransactionsSourceTransaction(
      GetSourcesSourceSourceTransactionsSourceTransactionParams params,
      GetSourcesSourceSourceTransactionsSourceTransactionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/source_transactions/{source_transaction}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    if (!params.source_transaction.isNull)
      requestor.setPathParam("source_transaction", params.source_transaction);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
