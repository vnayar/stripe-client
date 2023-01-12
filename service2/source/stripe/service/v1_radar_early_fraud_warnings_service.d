// File automatically generated from OpenAPI spec.
module stripe.service.v1_radar_early_fraud_warnings_service;

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
public import stripe.model.radar.early_fraud_warning : RadarEarlyFraudWarning;

/**
 * Service to make REST API calls to paths beginning with: /v1/radar/early_fraud_warnings
 */
class V1RadarEarlyFraudWarningsService {
  static class GetRadarEarlyFraudWarningsEarlyFraudWarningParams {
    /**
     */
    string early_fraud_warning;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetRadarEarlyFraudWarningsEarlyFraudWarningResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(RadarEarlyFraudWarning response) handleResponse200;

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
        handleResponse200(deserializeJson!(RadarEarlyFraudWarning)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an early fraud warning that has previously been created. </p>
   * <p>Please refer to the <a href="#early_fraud_warning_object">early fraud warning</a> object
   * reference for more details.</p>
   * See_Also: HTTP GET `/v1/radar/early_fraud_warnings/{early_fraud_warning}`
   */
  void getRadarEarlyFraudWarningsEarlyFraudWarning(
      GetRadarEarlyFraudWarningsEarlyFraudWarningParams params,
      GetRadarEarlyFraudWarningsEarlyFraudWarningResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/radar/early_fraud_warnings/{early_fraud_warning}");
    if (!params.early_fraud_warning.isNull)
      requestor.setPathParam("early_fraud_warning", params.early_fraud_warning);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetRadarEarlyFraudWarningsParams {
    /**
     * Only return early fraud warnings for the charge specified by this charge ID.
     */
    string charge;

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
     * Only return early fraud warnings for charges that were created by the PaymentIntent specified
     * by this PaymentIntent ID.
     */
    string payment_intent;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetRadarEarlyFraudWarningsResponseHandler : ResponseHandler {

    static class RadarEarlyFraudWarningList {
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
      RadarEarlyFraudWarning[] data;

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
    void delegate(RadarEarlyFraudWarningList response) handleResponse200;

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
        handleResponse200(deserializeJson!(RadarEarlyFraudWarningList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of early fraud warnings.</p>
   * See_Also: HTTP GET `/v1/radar/early_fraud_warnings`
   */
  void getRadarEarlyFraudWarnings(
      GetRadarEarlyFraudWarningsParams params,
      GetRadarEarlyFraudWarningsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/radar/early_fraud_warnings");
    if (!params.charge.isNull)
      requestor.setQueryParam!("deepObject")("charge", params.charge);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.payment_intent.isNull)
      requestor.setQueryParam!("deepObject")("payment_intent", params.payment_intent);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
