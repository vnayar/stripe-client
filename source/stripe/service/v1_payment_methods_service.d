// File automatically generated from OpenAPI spec.
module stripe.service.v1_payment_methods_service;

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
public import stripe.model.payment_method : PaymentMethod;

/**
 * Service to make REST API calls to paths beginning with: /v1/payment_methods
 */
class V1PaymentMethodsService {
  static class PostPaymentMethodsPaymentMethodDetachParams {
    /**
     */
    string payment_method;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Detaches a PaymentMethod object from a Customer. After a PaymentMethod is detached, it can
   * no longer be used for a payment or re-attached to a Customer.</p>
   * See_Also: HTTP POST `/v1/payment_methods/{payment_method}/detach`
   */
  void postPaymentMethodsPaymentMethodDetach(
      PostPaymentMethodsPaymentMethodDetachParams params,
      PostPaymentMethodsPaymentMethodDetachResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}/detach");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPaymentMethodsPaymentMethodParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string payment_method;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a PaymentMethod object attached to the StripeAccount. To retrieve a payment method
   * attached to a Customer, you should use <a href="/docs/api/payment_methods/customer">Retrieve a
   * Customer’s PaymentMethods</a></p>
   * See_Also: HTTP GET `/v1/payment_methods/{payment_method}`
   */
  void getPaymentMethodsPaymentMethod(
      GetPaymentMethodsPaymentMethodParams params,
      GetPaymentMethodsPaymentMethodResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsPaymentMethodParams {
    /**
     */
    string payment_method;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be
   * updated.</p>
   * See_Also: HTTP POST `/v1/payment_methods/{payment_method}`
   */
  void postPaymentMethodsPaymentMethod(
      PostPaymentMethodsPaymentMethodParams params,
      PostPaymentMethodsPaymentMethodResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsPaymentMethodAttachParams {
    /**
     */
    string payment_method;

  }

  static class PostPaymentMethodsPaymentMethodAttachBody {
    /**
     * The ID of the customer to which to attach the PaymentMethod.
     */
    @optional
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Attaches a PaymentMethod object to a Customer.</p>
   * <p>To attach a new PaymentMethod to a customer for future payments, we recommend you use a <a
   * href="/docs/api/setup_intents">SetupIntent</a>
   * or a PaymentIntent with <a
   * href="/docs/api/payment_intents/create#create_payment_intent-setup_future_usage">setup_future_u
   * sage</a>.
   * These approaches will perform any necessary steps to set up the PaymentMethod for future
   * payments. Using the <code>/v1/payment_methods/:id/attach</code>
   * endpoint without first using a SetupIntent or PaymentIntent with
   * <code>setup_future_usage</code> does not optimize the PaymentMethod for
   * future use, which makes later declines and payment friction more likely.
   * See <a href="/docs/payments/payment-intents#future-usage">Optimizing cards for future
   * payments</a> for more information about setting up
   * future payments.</p>
   * <p>To use this PaymentMethod as the default for invoice or subscription payments,
   * set <a
   * href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code
   * >invoice_settings.default_payment_method</code></a>,
   * on the Customer to the PaymentMethod’s ID.</p>
   * See_Also: HTTP POST `/v1/payment_methods/{payment_method}/attach`
   */
  void postPaymentMethodsPaymentMethodAttach(
      PostPaymentMethodsPaymentMethodAttachParams params,
      PostPaymentMethodsPaymentMethodAttachBody requestBody,
      PostPaymentMethodsPaymentMethodAttachResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}/attach");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentMethodsParams {
    /**
     * The ID of the customer whose PaymentMethods will be retrieved.
     */
    string customer;

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

    /**
     * An optional filter on the list, based on the object `type` field. Without the filter, the
     * list includes all current and future payment method types. If your integration expects only
     * one type of payment method in the response, make sure to provide a type value in the request.
     */
    string type;

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
      string object;

      @optional
      PaymentMethod[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentFlowsPaymentMethodList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of PaymentMethods for Treasury flows. If you want to list the PaymentMethods
   * attached to a Customer for payments, you should use the <a
   * href="/docs/api/payment_methods/customer_list">List a Customer’s PaymentMethods</a> API
   * instead.</p>
   * See_Also: HTTP GET `/v1/payment_methods`
   */
  void getPaymentMethods(
      GetPaymentMethodsParams params,
      GetPaymentMethodsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_methods");
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.type.isNull)
      requestor.setQueryParam!("deepObject")("type", params.type);
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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a PaymentMethod object. Read the <a
   * href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn
   * how to create PaymentMethods via Stripe.js.</p>
   * <p>Instead of creating a PaymentMethod directly, we recommend using the <a
   * href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately
   * or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method
   * details ahead of a future payment.</p>
   * See_Also: HTTP POST `/v1/payment_methods`
   */
  void postPaymentMethods(
      PostPaymentMethodsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
