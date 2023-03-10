// File automatically generated from OpenAPI spec.
module stripe.service.v1_file_links_service;

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
public import stripe.model.file_link : FileLink;

/**
 * Service to make REST API calls to paths beginning with: /v1/file_links
 */
class V1FileLinksService {
  static class GetFileLinksParams {
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
     * Filter links by their expiration status. By default, all links are returned.
     */
    Nullable!(bool) expired;

    /**
     * Only return links for the given file.
     */
    string file;

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

  static class GetFileLinksResponseHandler : ResponseHandler {

    static class FileFileLinkList {
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

      /**
       * Details about each object.
       */
      @optional
      FileLink[] data;

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
    void delegate(FileFileLinkList response) handleResponse200;

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
        handleResponse200(deserializeJson!(FileFileLinkList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of file links.</p>
   * See_Also: HTTP GET `/v1/file_links`
   */
  void getFileLinks(
      GetFileLinksParams params,
      GetFileLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/file_links");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.expired.isNull)
      requestor.setQueryParam!("deepObject")("expired", params.expired);
    if (!params.file.isNull)
      requestor.setQueryParam!("deepObject")("file", params.file);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostFileLinksBody {
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

    /**
     * A future timestamp after which the link will no longer be usable.
     */
    @optional
    Nullable!(long) expires_at;

    /**
     * The ID of the file. The file's `purpose` must be one of the following: `business_icon`,
     * `business_logo`, `customer_signature`, `dispute_evidence`, `finance_report_run`,
     * `identity_document_downloadable`, `pci_document`, `selfie`, `sigma_scheduled_query`,
     * `tax_document_user_upload`, or `terminal_reader_splashscreen`.
     */
    @optional
    string file;

    mixin AddBuilder!(typeof(this));

  }

  static class PostFileLinksResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FileLink response) handleResponse200;

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
        handleResponse200(deserializeJson!(FileLink)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new file link object.</p>
   * See_Also: HTTP POST `/v1/file_links`
   */
  void postFileLinks(
      PostFileLinksBody requestBody,
      PostFileLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/file_links");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetFileLinksLinkParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string link;

    mixin AddBuilder!(typeof(this));

  }

  static class GetFileLinksLinkResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FileLink response) handleResponse200;

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
        handleResponse200(deserializeJson!(FileLink)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the file link with the given ID.</p>
   * See_Also: HTTP GET `/v1/file_links/{link}`
   */
  void getFileLinksLink(
      GetFileLinksLinkParams params,
      GetFileLinksLinkResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/file_links/{link}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.link.isNull)
      requestor.setPathParam("link", params.link);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostFileLinksLinkParams {
    /**
     */
    string link;

    mixin AddBuilder!(typeof(this));

  }

  static class PostFileLinksLinkBody {
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

    /**
     * A future timestamp after which the link will no longer be usable, or `now` to expire the link
     * immediately.
     */
    @optional
    Json expires_at;

    mixin AddBuilder!(typeof(this));

  }

  static class PostFileLinksLinkResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FileLink response) handleResponse200;

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
        handleResponse200(deserializeJson!(FileLink)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing file link object. Expired links can no longer be updated.</p>
   * See_Also: HTTP POST `/v1/file_links/{link}`
   */
  void postFileLinksLink(
      PostFileLinksLinkParams params,
      PostFileLinksLinkBody requestBody,
      PostFileLinksLinkResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/file_links/{link}");
    if (!params.link.isNull)
      requestor.setPathParam("link", params.link);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
