// File automatically generated from OpenAPI spec.
module stripe.service.v1_apple_pay_domains_service;

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

public import stripe.model.apple_pay_domain : ApplePayDomain;
public import stripe.model.deleted_apple_pay_domain : DeletedApplePayDomain;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/apple_pay/domains
 */
class V1ApplePayDomainsService {
  static class GetApplePayDomainsDomainParams {
    /**
     */
    string domain;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetApplePayDomainsDomainResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ApplePayDomain response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApplePayDomain)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve an apple pay domain.</p>
   * See_Also: HTTP GET `/v1/apple_pay/domains/{domain}`
   */
  void getApplePayDomainsDomain(
      GetApplePayDomainsDomainParams params,
      GetApplePayDomainsDomainResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/apple_pay/domains/{domain}");
    if (!params.domain.isNull)
      requestor.setPathParam("domain", params.domain);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteApplePayDomainsDomainParams {
    /**
     */
    string domain;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteApplePayDomainsDomainResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedApplePayDomain response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedApplePayDomain)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete an apple pay domain.</p>
   * See_Also: HTTP DELETE `/v1/apple_pay/domains/{domain}`
   */
  void deleteApplePayDomainsDomain(
      DeleteApplePayDomainsDomainParams params,
      DeleteApplePayDomainsDomainResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/apple_pay/domains/{domain}");
    if (!params.domain.isNull)
      requestor.setPathParam("domain", params.domain);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetApplePayDomainsParams {
    /**
     */
    string domain_name;

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

    mixin AddBuilder!(typeof(this));

  }

  static class GetApplePayDomainsResponseHandler : ResponseHandler {

    static class ApplePayDomainList {
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
      ApplePayDomain[] data;

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
    void delegate(ApplePayDomainList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApplePayDomainList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>List apple pay domains.</p>
   * See_Also: HTTP GET `/v1/apple_pay/domains`
   */
  void getApplePayDomains(
      GetApplePayDomainsParams params,
      GetApplePayDomainsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/apple_pay/domains");
    if (!params.domain_name.isNull)
      requestor.setQueryParam!("deepObject")("domain_name", params.domain_name);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostApplePayDomainsBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    @optional
    string domain_name;

    mixin AddBuilder!(typeof(this));

  }

  static class PostApplePayDomainsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ApplePayDomain response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApplePayDomain)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create an apple pay domain.</p>
   * See_Also: HTTP POST `/v1/apple_pay/domains`
   */
  void postApplePayDomains(
      PostApplePayDomainsBody requestBody,
      PostApplePayDomainsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/apple_pay/domains");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
