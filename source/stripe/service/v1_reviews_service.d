// File automatically generated from OpenAPI spec.
module stripe.service.v1_reviews_service;

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
public import stripe.model.review : Review;

/**
 * Service to make REST API calls to paths beginning with: /v1/reviews
 */
class V1ReviewsService {
  static class GetReviewsParams {
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
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetReviewsResponseHandler : ResponseHandler {

    static class RadarReviewList {
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
      Review[] data;

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
    void delegate(RadarReviewList response) handleResponse200;

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
        handleResponse200(deserializeJson!(RadarReviewList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of <code>Review</code> objects that have <code>open</code> set to
   * <code>true</code>. The objects are sorted in descending order by creation date, with the most
   * recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/reviews`
   */
  void getReviews(
      GetReviewsParams params,
      GetReviewsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/reviews");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
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

  static class PostReviewsReviewApproveParams {
    /**
     */
    string review;

    mixin AddBuilder!(typeof(this));

  }

  static class PostReviewsReviewApproveResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Review response) handleResponse200;

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
        handleResponse200(deserializeJson!(Review)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Approves a <code>Review</code> object, closing it and removing it from the list of
   * reviews.</p>
   * See_Also: HTTP POST `/v1/reviews/{review}/approve`
   */
  void postReviewsReviewApprove(
      PostReviewsReviewApproveParams params,
      PostReviewsReviewApproveResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/reviews/{review}/approve");
    if (!params.review.isNull)
      requestor.setPathParam("review", params.review);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetReviewsReviewParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string review;

    mixin AddBuilder!(typeof(this));

  }

  static class GetReviewsReviewResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Review response) handleResponse200;

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
        handleResponse200(deserializeJson!(Review)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a <code>Review</code> object.</p>
   * See_Also: HTTP GET `/v1/reviews/{review}`
   */
  void getReviewsReview(
      GetReviewsReviewParams params,
      GetReviewsReviewResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/reviews/{review}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.review.isNull)
      requestor.setPathParam("review", params.review);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
