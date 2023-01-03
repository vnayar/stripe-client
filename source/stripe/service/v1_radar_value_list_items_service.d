// File automatically generated from OpenAPI spec.
module stripe.service.v1_radar_value_list_items_service;

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

public import stripe.model.deleted_radar.value_list_item : DeletedRadarValueListItem;
public import stripe.model.error : Error_;
public import stripe.model.radar.value_list_item : RadarValueListItem;

/**
 * Service to make REST API calls to paths beginning with: /v1/radar/value_list_items
 */
class V1RadarValueListItemsService {
  static class GetRadarValueListItemsParams {
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

    /**
     * Return items belonging to the parent list whose value matches the specified value (using an
     * "is like" match).
     */
    Nullable!(Nullable!(string)) value;

    /**
     * Identifier for the parent value list this item belongs to.
     */
    Nullable!(Nullable!(string)) value_list;

  }

  static class GetRadarValueListItemsResponseHandler : ResponseHandler {

    static class RadarListListItemList {
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
      RadarValueListItem[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(RadarListListItemList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarListListItemList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of <code>ValueListItem</code> objects. The objects are sorted in descending
   * order by creation date, with the most recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/radar/value_list_items`
   */
  void getRadarValueListItems(
      GetRadarValueListItemsParams params,
      GetRadarValueListItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/radar/value_list_items");
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
    if (!params.value.isNull)
      requestor.setQueryParam("value", params.value.get.to!string);
    if (!params.value_list.isNull)
      requestor.setQueryParam("value_list", params.value_list.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostRadarValueListItemsBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The value of the item (whose type must match the type of the parent value list).
     */
    @optional
    Nullable!(string) value;

    /**
     * The identifier of the value list which the created item will be added to.
     */
    @optional
    Nullable!(string) value_list;

  }

  static class PostRadarValueListItemsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(RadarValueListItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarValueListItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a new <code>ValueListItem</code> object, which is added to the specified parent
   * value list.</p>
   * See_Also: HTTP POST `/v1/radar/value_list_items`
   */
  void postRadarValueListItems(
      PostRadarValueListItemsBody requestBody,
      PostRadarValueListItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/radar/value_list_items");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetRadarValueListItemsItemParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) item;

  }

  static class GetRadarValueListItemsItemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(RadarValueListItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RadarValueListItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a <code>ValueListItem</code> object.</p>
   * See_Also: HTTP GET `/v1/radar/value_list_items/{item}`
   */
  void getRadarValueListItemsItem(
      GetRadarValueListItemsItemParams params,
      GetRadarValueListItemsItemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/radar/value_list_items/{item}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.item.isNull)
      requestor.setPathParam("item", params.item.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteRadarValueListItemsItemParams {
    /**
     */
    Nullable!(Nullable!(string)) item;

  }

  static class DeleteRadarValueListItemsItemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedRadarValueListItem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedRadarValueListItem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Deletes a <code>ValueListItem</code> object, removing it from its parent value list.</p>
   * See_Also: HTTP DELETE `/v1/radar/value_list_items/{item}`
   */
  void deleteRadarValueListItemsItem(
      DeleteRadarValueListItemsItemParams params,
      DeleteRadarValueListItemsItemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/radar/value_list_items/{item}");
    if (!params.item.isNull)
      requestor.setPathParam("item", params.item.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
