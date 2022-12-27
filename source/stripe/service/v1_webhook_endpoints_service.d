// File automatically generated from OpenAPI spec.
module stripe.service.v1_webhook_endpoints_service;

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

public import stripe.model.deleted_webhook_endpoint : DeletedWebhookEndpoint;
public import stripe.model.error : Error_;
public import stripe.model.webhook_endpoint : WebhookEndpoint;
/**
 * Service to make REST API calls to paths beginning with: /v1/webhook_endpoints
 */
class V1WebhookEndpointsService {
  static class GetWebhookEndpointsParams {
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

  static class GetWebhookEndpointsResponseHandler : ResponseHandler {

    static class NotificationWebhookEndpointList {
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
      WebhookEndpoint[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(NotificationWebhookEndpointList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(NotificationWebhookEndpointList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getWebhookEndpoints(
      GetWebhookEndpointsParams params,
      GetWebhookEndpointsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/webhook_endpoints");
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

  static class PostWebhookEndpointsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Whether this endpoint should receive events from connected accounts (`true`), or from your
     * account (`false`). Defaults to `false`.
     */
    @optional
    Nullable!(bool) connect;

    /**
     * The URL of the webhook endpoint.
     */
    @optional
    Nullable!(string) url;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * Events sent to this endpoint will be generated with this Stripe Version instead of your
     * account's default Stripe Version.
     */
    @optional
    Nullable!(string) api_version;

    /**
     * An optional description of what the webhook is used for.
     */
    @optional
    Nullable!(string) description;

    /**
     * The list of events to enable for this endpoint. You may specify `['*']` to enable all events,
     * except those that require explicit selection.
     */
    @optional
    Nullable!(string)[] enabled_events;

  }

  static class PostWebhookEndpointsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(WebhookEndpoint response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(WebhookEndpoint)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postWebhookEndpoints(
      PostWebhookEndpointsBody requestBody,
      PostWebhookEndpointsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/webhook_endpoints");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetWebhookEndpointsWebhookEndpointParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) webhook_endpoint;

  }

  static class GetWebhookEndpointsWebhookEndpointResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(WebhookEndpoint response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(WebhookEndpoint)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getWebhookEndpointsWebhookEndpoint(
      GetWebhookEndpointsWebhookEndpointParams params,
      GetWebhookEndpointsWebhookEndpointResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/webhook_endpoints/{webhook_endpoint}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.webhook_endpoint.isNull)
      requestor.setPathParam("webhook_endpoint", params.webhook_endpoint.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostWebhookEndpointsWebhookEndpointParams {
    /**
     */
    Nullable!(Nullable!(string)) webhook_endpoint;

  }

  static class PostWebhookEndpointsWebhookEndpointResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(WebhookEndpoint response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(WebhookEndpoint)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postWebhookEndpointsWebhookEndpoint(
      PostWebhookEndpointsWebhookEndpointParams params,
      PostWebhookEndpointsWebhookEndpointResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/webhook_endpoints/{webhook_endpoint}");
    if (!params.webhook_endpoint.isNull)
      requestor.setPathParam("webhook_endpoint", params.webhook_endpoint.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteWebhookEndpointsWebhookEndpointParams {
    /**
     */
    Nullable!(Nullable!(string)) webhook_endpoint;

  }

  static class DeleteWebhookEndpointsWebhookEndpointResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedWebhookEndpoint response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedWebhookEndpoint)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteWebhookEndpointsWebhookEndpoint(
      DeleteWebhookEndpointsWebhookEndpointParams params,
      DeleteWebhookEndpointsWebhookEndpointResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/webhook_endpoints/{webhook_endpoint}");
    if (!params.webhook_endpoint.isNull)
      requestor.setPathParam("webhook_endpoint", params.webhook_endpoint.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
