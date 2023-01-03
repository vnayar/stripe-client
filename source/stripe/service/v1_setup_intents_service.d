// File automatically generated from OpenAPI spec.
module stripe.service.v1_setup_intents_service;

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
public import stripe.model.setup_intent : SetupIntent;

/**
 * Service to make REST API calls to paths beginning with: /v1/setup_intents
 */
class V1SetupIntentsService {
  static class GetSetupIntentsIntentParams {
    /**
     * The client secret of the SetupIntent. Required if a publishable key is used to retrieve the
     * SetupIntent.
     */
    Nullable!(Nullable!(string)) client_secret;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class GetSetupIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of a SetupIntent that has previously been created. </p>
   * <p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code>
   * is provided in the query string. </p>
   * <p>When retrieved with a publishable key, only a subset of properties will be returned. Please
   * refer to the <a href="#setup_intent_object">SetupIntent</a> object reference for more
   * details.</p>
   * See_Also: HTTP GET `/v1/setup_intents/{intent}`
   */
  void getSetupIntentsIntent(
      GetSetupIntentsIntentParams params,
      GetSetupIntentsIntentResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam("client_secret", params.client_secret.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsIntentParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostSetupIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates a SetupIntent object.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}`
   */
  void postSetupIntentsIntent(
      PostSetupIntentsIntentParams params,
      PostSetupIntentsIntentResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetSetupIntentsParams {
    /**
     * If present, the SetupIntent's payment method will be attached to the in-context Stripe
     * Account.
     * It can only be used for this Stripe Account’s own money movement flows like InboundTransfer
     * and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a
     * Customer, and defaults to false when attaching a PaymentMethod to a Customer.
     */
    Nullable!(Nullable!(bool)) attach_to_self;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Nullable!(Json) created;

    /**
     * Only return SetupIntents for the customer specified by this customer ID.
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
     * Only return SetupIntents associated with the specified payment method.
     */
    Nullable!(Nullable!(string)) payment_method;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

  }

  static class GetSetupIntentsResponseHandler : ResponseHandler {

    static class PaymentFlowsSetupIntentList {
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
      SetupIntent[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PaymentFlowsSetupIntentList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentFlowsSetupIntentList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of SetupIntents.</p>
   * See_Also: HTTP GET `/v1/setup_intents`
   */
  void getSetupIntents(
      GetSetupIntentsParams params,
      GetSetupIntentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/setup_intents");
    if (!params.attach_to_self.isNull)
      requestor.setQueryParam("attach_to_self", params.attach_to_self.get.to!string);
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.payment_method.isNull)
      requestor.setQueryParam("payment_method", params.payment_method.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a SetupIntent object.</p>
   * <p>After the SetupIntent is created, attach a payment method and <a
   * href="/docs/api/setup_intents/confirm">confirm</a>
   * to collect any required permissions to charge the payment method later.</p>
   * See_Also: HTTP POST `/v1/setup_intents`
   */
  void postSetupIntents(
      PostSetupIntentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsIntentConfirmParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostSetupIntentsIntentConfirmResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Confirm that your customer intends to set up the current or
   * provided payment method. For example, you would confirm a SetupIntent
   * when a customer hits the “Save” button on a payment method management
   * page on your website.</p>
   * <p>If the selected payment method does not require any additional
   * steps from the customer, the SetupIntent will transition to the
   * <code>succeeded</code> status.</p>
   * <p>Otherwise, it will transition to the <code>requires_action</code> status and
   * suggest additional actions via <code>next_action</code>. If setup fails,
   * the SetupIntent will transition to the
   * <code>requires_payment_method</code> status.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}/confirm`
   */
  void postSetupIntentsIntentConfirm(
      PostSetupIntentsIntentConfirmParams params,
      PostSetupIntentsIntentConfirmResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}/confirm");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsIntentCancelParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostSetupIntentsIntentCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>A SetupIntent object can be canceled when it is in one of these statuses:
   * <code>requires_payment_method</code>, <code>requires_confirmation</code>, or
   * <code>requires_action</code>. </p>
   * <p>Once canceled, setup is abandoned and any operations on the SetupIntent will fail with an
   * error.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}/cancel`
   */
  void postSetupIntentsIntentCancel(
      PostSetupIntentsIntentCancelParams params,
      PostSetupIntentsIntentCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}/cancel");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsIntentVerifyMicrodepositsParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostSetupIntentsIntentVerifyMicrodepositsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Verifies microdeposits on a SetupIntent object.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}/verify_microdeposits`
   */
  void postSetupIntentsIntentVerifyMicrodeposits(
      PostSetupIntentsIntentVerifyMicrodepositsParams params,
      PostSetupIntentsIntentVerifyMicrodepositsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}/verify_microdeposits");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
