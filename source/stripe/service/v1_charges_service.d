// File automatically generated from OpenAPI spec.
module stripe.service.v1_charges_service;

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

public import stripe.model.charge : Charge;
public import stripe.model.dispute : Dispute;
public import stripe.model.error : Error_;
public import stripe.model.refund : Refund;

/**
 * Service to make REST API calls to paths beginning with: /v1/charges
 */
class V1ChargesService {
  static class GetChargesChargeRefundsParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

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

  static class GetChargesChargeRefundsResponseHandler : ResponseHandler {

    static class RefundList {
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

      /**
       * Details about each object.
       */
      @optional
      Refund[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(RefundList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(RefundList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>You can see a list of the refunds belonging to a specific charge. Note that the 10 most
   * recent refunds are always available by default on the charge object. If you need more than
   * those 10, you can use this API method and the <code>limit</code> and
   * <code>starting_after</code> parameters to page through additional refunds.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}/refunds`
   */
  void getChargesChargeRefunds(
      GetChargesChargeRefundsParams params,
      GetChargesChargeRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
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

  static class PostChargesChargeRefundsParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

  }

  static class PostChargesChargeRefundsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Create a refund.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/refunds`
   */
  void postChargesChargeRefunds(
      PostChargesChargeRefundsParams params,
      PostChargesChargeRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeCaptureParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

  }

  static class PostChargesChargeCaptureResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Capture the payment of an existing, uncaptured, charge. This is the second half of the
   * two-step payment flow, where first you <a href="#create_charge">created a charge</a> with the
   * capture option set to false.</p>
   * <p>Uncaptured payments expire a set number of days after they are created (<a
   * href="/docs/charges/placing-a-hold">7 by default</a>). If they are not captured by that point
   * in time, they will be marked as refunded and will no longer be capturable.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/capture`
   */
  void postChargesChargeCapture(
      PostChargesChargeCaptureParams params,
      PostChargesChargeCaptureResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/capture");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetChargesParams {
    /**
     */
    Nullable!(Json) created;

    /**
     * Only return charges for the customer specified by this customer ID.
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
     * Only return charges that were created by the PaymentIntent specified by this PaymentIntent
     * ID.
     */
    Nullable!(Nullable!(string)) payment_intent;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * Only return charges for this transfer group.
     */
    Nullable!(Nullable!(string)) transfer_group;

  }

  static class GetChargesResponseHandler : ResponseHandler {

    static class ChargeList {
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
      Charge[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(ChargeList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(ChargeList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of charges you’ve previously created. The charges are returned in sorted
   * order, with the most recent charges appearing first.</p>
   * See_Also: HTTP GET `/v1/charges`
   */
  void getCharges(
      GetChargesParams params,
      GetChargesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges");
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
    if (!params.payment_intent.isNull)
      requestor.setQueryParam("payment_intent", params.payment_intent.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.transfer_group.isNull)
      requestor.setQueryParam("transfer_group", params.transfer_group.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>To charge a credit card or other payment source, you create a <code>Charge</code> object. If
   * your API key is in test mode, the supplied payment source (e.g., card) won’t actually be
   * charged, although everything else will occur as if in live mode. (Stripe assumes that the
   * charge would have completed successfully).</p>
   * See_Also: HTTP POST `/v1/charges`
   */
  void postCharges(
      PostChargesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetChargesChargeDisputeParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetChargesChargeDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieve a dispute for a specified charge.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}/dispute`
   */
  void getChargesChargeDispute(
      GetChargesChargeDisputeParams params,
      GetChargesChargeDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/dispute");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeDisputeParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

  }

  static class PostChargesChargeDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * See_Also: HTTP POST `/v1/charges/{charge}/dispute`
   */
  void postChargesChargeDispute(
      PostChargesChargeDisputeParams params,
      PostChargesChargeDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/dispute");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetChargesChargeParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetChargesChargeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of a charge that has previously been created. Supply the unique charge
   * ID that was returned from your previous request, and Stripe will return the corresponding
   * charge information. The same information is returned when creating or refunding the charge.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}`
   */
  void getChargesCharge(
      GetChargesChargeParams params,
      GetChargesChargeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

  }

  static class PostChargesChargeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the specified charge by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}`
   */
  void postChargesCharge(
      PostChargesChargeParams params,
      PostChargesChargeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeRefundParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

  }

  static class PostChargesChargeRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>When you create a new refund, you must specify a Charge or a PaymentIntent object on which
   * to create it.</p>
   * <p>Creating a new refund will refund a charge that has previously been created but not yet
   * refunded.
   * Funds will be refunded to the credit or debit card that was originally charged.</p>
   * <p>You can optionally refund only part of a charge.
   * You can do so multiple times, until the entire charge has been refunded.</p>
   * <p>Once entirely refunded, a charge can’t be refunded again.
   * This method will raise an error when called on an already-refunded charge,
   * or when trying to refund more money than is left on a charge.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/refund`
   */
  void postChargesChargeRefund(
      PostChargesChargeRefundParams params,
      PostChargesChargeRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refund");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeDisputeCloseParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

  }

  static class PostChargesChargeDisputeCloseResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * See_Also: HTTP POST `/v1/charges/{charge}/dispute/close`
   */
  void postChargesChargeDisputeClose(
      PostChargesChargeDisputeCloseParams params,
      PostChargesChargeDisputeCloseResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/dispute/close");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetChargesChargeRefundsRefundParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) refund;

  }

  static class GetChargesChargeRefundsRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of an existing refund.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}/refunds/{refund}`
   */
  void getChargesChargeRefundsRefund(
      GetChargesChargeRefundsRefundParams params,
      GetChargesChargeRefundsRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds/{refund}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeRefundsRefundParams {
    /**
     */
    Nullable!(Nullable!(string)) charge;

    /**
     */
    Nullable!(Nullable!(string)) refund;

  }

  static class PostChargesChargeRefundsRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Update a specified refund.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/refunds/{refund}`
   */
  void postChargesChargeRefundsRefund(
      PostChargesChargeRefundsRefundParams params,
      PostChargesChargeRefundsRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds/{refund}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge.get.to!string);
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
