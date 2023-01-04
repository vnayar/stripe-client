// File automatically generated from OpenAPI spec.
module stripe.service.v1_files_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.error : Error_;
public import stripe.model.file : File;

/**
 * Service to make REST API calls to paths beginning with: /v1/files
 */
class V1FilesService {
  static class GetFilesParams {
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
     * The file purpose to filter queries by. If none is provided, files will not be filtered by
     * purpose.
     */
    string purpose;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

  }

  static class GetFilesResponseHandler : ResponseHandler {

    static class FileFileList {
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
      File[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(FileFileList response) handleResponse200;

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
        handleResponse200(deserializeJson!(FileFileList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of the files that your account has access to. The files are returned sorted
   * by creation date, with the most recently created files appearing first.</p>
   * See_Also: HTTP GET `/v1/files`
   */
  void getFiles(
      GetFilesParams params,
      GetFilesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/files");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.purpose.isNull)
      requestor.setQueryParam!("deepObject")("purpose", params.purpose);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostFilesBody {
    static class FileLinkCreationParams {
      @optional
      Json metadata;

      @optional
      Nullable!(long) expires_at;

      @optional
      Nullable!(bool) create;

    }

    /**
     * Optional parameters to automatically create a [file
     * link](https://stripe.com/docs/api#file_links) for the newly created file.
     */
    @optional
    FileLinkCreationParams file_link_data;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * A file to upload. The file should follow the specifications of RFC 2388 (which defines file
     * transfers for the `multipart/form-data` protocol).
     */
    @optional
    string file;

    /**
     * The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
     */
    @optional
    string purpose;

  }

  static class PostFilesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(File response) handleResponse200;

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
        handleResponse200(deserializeJson!(File)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>To upload a file to Stripe, you’ll need to send a request of type
   * <code>multipart/form-data</code>. The request should contain the file you would like to upload,
   * as well as the parameters for creating a file.</p>
   * <p>All of Stripe’s officially supported Client libraries should have support for sending
   * <code>multipart/form-data</code>.</p>
   * See_Also: HTTP POST `/v1/files`
   */
  void postFiles(
      PostFilesBody requestBody,
      PostFilesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/files");
    requestor.setHeaderParam("Content-Type", "multipart/form-data");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetFilesFileParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string file;

  }

  static class GetFilesFileResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(File response) handleResponse200;

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
        handleResponse200(deserializeJson!(File)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of an existing file object. Supply the unique file ID from a file, and
   * Stripe will return the corresponding file object. To access file contents, see the <a
   * href="/docs/file-upload#download-file-contents">File Upload Guide</a>.</p>
   * See_Also: HTTP GET `/v1/files/{file}`
   */
  void getFilesFile(
      GetFilesFileParams params,
      GetFilesFileResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/files/{file}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.file.isNull)
      requestor.setPathParam("file", params.file);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
