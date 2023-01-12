// File automatically generated from OpenAPI spec.
module stripe.service.v1_terminal_configurations_service;

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
    string configuration;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTerminalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

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
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a <code>Configuration</code> object.</p>
   * See_Also: HTTP GET `/v1/terminal/configurations/{configuration}`
   */
  void getTerminalConfigurationsConfiguration(
      GetTerminalConfigurationsConfigurationParams params,
      GetTerminalConfigurationsConfigurationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/terminal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalConfigurationsConfigurationParams {
    /**
     */
    string configuration;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTerminalConfigurationsConfigurationBody {
    /**
     * An object containing device type specific settings for BBPOS WisePOS E readers
     */
    @optional
    Json bbpos_wisepos_e;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * An object containing device type specific settings for Verifone P400 readers
     */
    @optional
    Json verifone_p400;

    /**
     * Tipping configurations for readers supporting on-reader tips
     */
    @optional
    Json tipping;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTerminalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

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
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates a new <code>Configuration</code> object.</p>
   * See_Also: HTTP POST `/v1/terminal/configurations/{configuration}`
   */
  void postTerminalConfigurationsConfiguration(
      PostTerminalConfigurationsConfigurationParams params,
      PostTerminalConfigurationsConfigurationBody requestBody,
      PostTerminalConfigurationsConfigurationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteTerminalConfigurationsConfigurationParams {
    /**
     */
    string configuration;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteTerminalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedTerminalConfiguration response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedTerminalConfiguration)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Deletes a <code>Configuration</code> object.</p>
   * See_Also: HTTP DELETE `/v1/terminal/configurations/{configuration}`
   */
  void deleteTerminalConfigurationsConfiguration(
      DeleteTerminalConfigurationsConfigurationParams params,
      DeleteTerminalConfigurationsConfigurationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/terminal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration);
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
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * if present, only return the account default or non-default configurations.
     */
    Nullable!(bool) is_account_default;

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

    mixin AddBuilder!(typeof(this));

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
      string object;

      @optional
      TerminalConfiguration[] data;

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
    void delegate(TerminalConfigurationConfigurationList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TerminalConfigurationConfigurationList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of <code>Configuration</code> objects.</p>
   * See_Also: HTTP GET `/v1/terminal/configurations`
   */
  void getTerminalConfigurations(
      GetTerminalConfigurationsParams params,
      GetTerminalConfigurationsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/terminal/configurations");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.is_account_default.isNull)
      requestor.setQueryParam!("deepObject")("is_account_default", params.is_account_default);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalConfigurationsBody {
    static class BbposWisePose {
      @optional
      Json splashscreen;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * An object containing device type specific settings for BBPOS WisePOS E readers
     */
    @optional
    BbposWisePose bbpos_wisepos_e;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class VerifoneP400 {
      @optional
      Json splashscreen;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * An object containing device type specific settings for Verifone P400 readers
     */
    @optional
    VerifoneP400 verifone_p400;

    /**
     * Tipping configurations for readers supporting on-reader tips
     */
    @optional
    Json tipping;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTerminalConfigurationsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalConfiguration response) handleResponse200;

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
        handleResponse200(deserializeJson!(TerminalConfiguration)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new <code>Configuration</code> object.</p>
   * See_Also: HTTP POST `/v1/terminal/configurations`
   */
  void postTerminalConfigurations(
      PostTerminalConfigurationsBody requestBody,
      PostTerminalConfigurationsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/configurations");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
