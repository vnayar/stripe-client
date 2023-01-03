// File automatically generated from OpenAPI spec.
module stripe.service.v1_radar_value_lists_service;

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

public import stripe.model.deleted_radar.value_list : DeletedRadarValueList;
public import stripe.model.error : Error_;
public import stripe.model.radar.value_list : RadarValueList;

/**
 * Service to make REST API calls to paths beginning with: /v1/radar/value_lists
 */
class V1RadarValueListsService {
  static class GetRadarValueListsValueListParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) value_list;

  }

  static class GetRadarValueListsValueListResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(RadarValueList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarValueList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a <code>ValueList</code> object.</p>
   * See_Also: HTTP GET `/v1/radar/value_lists/{value_list}`
   */
  void getRadarValueListsValueList(
      GetRadarValueListsValueListParams params,
      GetRadarValueListsValueListResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/radar/value_lists/{value_list}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.value_list.isNull)
      requestor.setPathParam("value_list", params.value_list.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostRadarValueListsValueListParams {
    /**
     */
    Nullable!(Nullable!(string)) value_list;

  }

  static class PostRadarValueListsValueListResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(RadarValueList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarValueList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates a <code>ValueList</code> object by setting the values of the parameters passed. Any
   * parameters not provided will be left unchanged. Note that <code>item_type</code> is
   * immutable.</p>
   * See_Also: HTTP POST `/v1/radar/value_lists/{value_list}`
   */
  void postRadarValueListsValueList(
      PostRadarValueListsValueListParams params,
      PostRadarValueListsValueListResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/radar/value_lists/{value_list}");
    if (!params.value_list.isNull)
      requestor.setPathParam("value_list", params.value_list.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteRadarValueListsValueListParams {
    /**
     */
    Nullable!(Nullable!(string)) value_list;

  }

  static class DeleteRadarValueListsValueListResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedRadarValueList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedRadarValueList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Deletes a <code>ValueList</code> object, also deleting any items contained within the value
   * list. To be deleted, a value list must not be referenced in any rules.</p>
   * See_Also: HTTP DELETE `/v1/radar/value_lists/{value_list}`
   */
  void deleteRadarValueListsValueList(
      DeleteRadarValueListsValueListParams params,
      DeleteRadarValueListsValueListResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/radar/value_lists/{value_list}");
    if (!params.value_list.isNull)
      requestor.setPathParam("value_list", params.value_list.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetRadarValueListsParams {
    /**
     * The alias used to reference the value list when writing rules.
     */
    Nullable!(Nullable!(string)) alias_;

    /**
     * A value contained within a value list - returns all value lists containing this value.
     */
    Nullable!(Nullable!(string)) contains;

    /**
     */
    Nullable!(Json) created;

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

  static class GetRadarValueListsResponseHandler : ResponseHandler {

    static class RadarListListList {
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
      RadarValueList[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(RadarListListList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarListListList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of <code>ValueList</code> objects. The objects are sorted in descending order
   * by creation date, with the most recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/radar/value_lists`
   */
  void getRadarValueLists(
      GetRadarValueListsParams params,
      GetRadarValueListsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/radar/value_lists");
    if (!params.alias_.isNull)
      requestor.setQueryParam("alias", params.alias_.get.to!string);
    if (!params.contains.isNull)
      requestor.setQueryParam("contains", params.contains.get.to!string);
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
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

  static class PostRadarValueListsBody {
    /**
     * The name of the value list for use in rules.
     */
    @optional
    Nullable!(string) alias_;

    /**
     * Type of the items in the value list. One of `card_fingerprint`, `card_bin`, `email`,
     * `ip_address`, `country`, `string`, `case_sensitive_string`, or `customer_id`. Use `string` if
     * the item type is unknown or mixed.
     */
    @optional
    Nullable!(string) item_type;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * The human-readable name of the value list.
     */
    @optional
    Nullable!(string) name;

  }

  static class PostRadarValueListsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(RadarValueList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarValueList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a new <code>ValueList</code> object, which can then be referenced in rules.</p>
   * See_Also: HTTP POST `/v1/radar/value_lists`
   */
  void postRadarValueLists(
      PostRadarValueListsBody requestBody,
      PostRadarValueListsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/radar/value_lists");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
