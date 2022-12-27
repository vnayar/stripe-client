// File automatically generated from OpenAPI spec.
module stripe.service.v1_sources_service;

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
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) mandate_notification;

    /**
     */
    Nullable!(Nullable!(string)) source;

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
        handleResponse200(deserializeJson!(SourceMandateNotification)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getSourcesSourceMandateNotificationsMandateNotification(
      GetSourcesSourceMandateNotificationsMandateNotificationParams params,
      GetSourcesSourceMandateNotificationsMandateNotificationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/mandate_notifications/{mandate_notification}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.mandate_notification.isNull)
      requestor.setPathParam("mandate_notification", params.mandate_notification.get.to!string);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source.get.to!string);
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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postSources(
      PostSourcesResponseHandler responseHandler = null,
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
    Nullable!(Nullable!(string)) client_secret;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) source;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getSourcesSource(
      GetSourcesSourceParams params,
      GetSourcesSourceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam("client_secret", params.client_secret.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesSourceParams {
    /**
     */
    Nullable!(Nullable!(string)) source;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postSourcesSource(
      PostSourcesSourceParams params,
      PostSourcesSourceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources/{source}");
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source.get.to!string);
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
     */
    Nullable!(Nullable!(string)) source;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      @optional
      SourceTransaction[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(ApmsSourcesSourceTransactionList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getSourcesSourceSourceTransactions(
      GetSourcesSourceSourceTransactionsParams params,
      GetSourcesSourceSourceTransactionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/source_transactions");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesSourceVerifyParams {
    /**
     */
    Nullable!(Nullable!(string)) source;

  }

  static class PostSourcesSourceVerifyBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The values needed to verify the source.
     */
    @optional
    Nullable!(string)[] values;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postSourcesSourceVerify(
      PostSourcesSourceVerifyParams params,
      PostSourcesSourceVerifyBody requestBody,
      PostSourcesSourceVerifyResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources/{source}/verify");
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSourcesSourceSourceTransactionsSourceTransactionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) source;

    /**
     */
    Nullable!(Nullable!(string)) source_transaction;

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
        handleResponse200(deserializeJson!(SourceTransaction)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getSourcesSourceSourceTransactionsSourceTransaction(
      GetSourcesSourceSourceTransactionsSourceTransactionParams params,
      GetSourcesSourceSourceTransactionsSourceTransactionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/source_transactions/{source_transaction}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source.get.to!string);
    if (!params.source_transaction.isNull)
      requestor.setPathParam("source_transaction", params.source_transaction.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
