// File automatically generated from OpenAPI spec.
module stripe.service.v1_payment_methods_service;

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

public import stripe.model.error : Error_;
public import stripe.model.payment_method : PaymentMethod;
/**
 * Service to make REST API calls to paths beginning with: /v1/payment_methods
 */
class V1PaymentMethodsService {
  static class PostPaymentMethodsPaymentMethodDetachParams {
    /**
     */
    Nullable!(Nullable!(string)) payment_method;

  }

  static class PostPaymentMethodsPaymentMethodDetachResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentMethodsPaymentMethodDetach(
      PostPaymentMethodsPaymentMethodDetachParams params,
      PostPaymentMethodsPaymentMethodDetachResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}/detach");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPaymentMethodsPaymentMethodParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) payment_method;

  }

  static class GetPaymentMethodsPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPaymentMethodsPaymentMethod(
      GetPaymentMethodsPaymentMethodParams params,
      GetPaymentMethodsPaymentMethodResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsPaymentMethodParams {
    /**
     */
    Nullable!(Nullable!(string)) payment_method;

  }

  static class PostPaymentMethodsPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentMethodsPaymentMethod(
      PostPaymentMethodsPaymentMethodParams params,
      PostPaymentMethodsPaymentMethodResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsPaymentMethodAttachParams {
    /**
     */
    Nullable!(Nullable!(string)) payment_method;

  }

  static class PostPaymentMethodsPaymentMethodAttachBody {
    /**
     * The ID of the customer to which to attach the PaymentMethod.
     */
    @optional
    Nullable!(string) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

  }

  static class PostPaymentMethodsPaymentMethodAttachResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentMethodsPaymentMethodAttach(
      PostPaymentMethodsPaymentMethodAttachParams params,
      PostPaymentMethodsPaymentMethodAttachBody requestBody,
      PostPaymentMethodsPaymentMethodAttachResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}/attach");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentMethodsParams {
    /**
     * The ID of the customer whose PaymentMethods will be retrieved.
     */
    Nullable!(Nullable!(string)) customer;

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
     * An optional filter on the list, based on the object `type` field. Without the filter, the
     * list includes all current and future payment method types. If your integration expects only
     * one type of payment method in the response, make sure to provide a type value in the request.
     */
    Nullable!(Nullable!(string)) type;

  }

  static class GetPaymentMethodsResponseHandler : ResponseHandler {

    static class PaymentFlowsPaymentMethodList {
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
      PaymentMethod[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PaymentFlowsPaymentMethodList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentFlowsPaymentMethodList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPaymentMethods(
      GetPaymentMethodsParams params,
      GetPaymentMethodsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_methods");
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentMethods(
      PostPaymentMethodsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
