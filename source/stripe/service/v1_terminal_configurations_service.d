// File automatically generated from OpenAPI spec.
module stripe.service.v1_terminal_configurations_service;

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

public import stripe.model.deleted_terminal.configuration : DeletedTerminalConfiguration;
public import stripe.model.error : Error_;
public import stripe.model.terminal.configuration : TerminalConfiguration;
/**
 * Service to make REST API calls to paths beginning with: /v1/terminal/configurations
 */
class V1TerminalConfigurationsService {
  static class GetTerminalConfigurationsConfigurationParams {
    /**
     */
    Nullable!(Nullable!(string)) configuration;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetTerminalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTerminalConfigurationsConfiguration(
      GetTerminalConfigurationsConfigurationParams params,
      GetTerminalConfigurationsConfigurationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/terminal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalConfigurationsConfigurationParams {
    /**
     */
    Nullable!(Nullable!(string)) configuration;

  }

  static class PostTerminalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalConfigurationsConfiguration(
      PostTerminalConfigurationsConfigurationParams params,
      PostTerminalConfigurationsConfigurationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteTerminalConfigurationsConfigurationParams {
    /**
     */
    Nullable!(Nullable!(string)) configuration;

  }

  static class DeleteTerminalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedTerminalConfiguration response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedTerminalConfiguration)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteTerminalConfigurationsConfiguration(
      DeleteTerminalConfigurationsConfigurationParams params,
      DeleteTerminalConfigurationsConfigurationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/terminal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTerminalConfigurationsParams {
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
     * if present, only return the account default or non-default configurations.
     */
    Nullable!(Nullable!(bool)) is_account_default;

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

  static class GetTerminalConfigurationsResponseHandler : ResponseHandler {

    static class TerminalConfigurationConfigurationList {
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
      TerminalConfiguration[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TerminalConfigurationConfigurationList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalConfigurationConfigurationList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTerminalConfigurations(
      GetTerminalConfigurationsParams params,
      GetTerminalConfigurationsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/terminal/configurations");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.is_account_default.isNull)
      requestor.setQueryParam("is_account_default", params.is_account_default.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalConfigurationsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalConfiguration response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalConfiguration)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalConfigurations(
      PostTerminalConfigurationsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/configurations");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
