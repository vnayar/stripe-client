// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_outbound_payments_service;

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
public import stripe.model.treasury.outbound_payment : TreasuryOutboundPayment;

/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/outbound_payments
 */
class V1TreasuryOutboundPaymentsService {
  static class GetTreasuryOutboundPaymentsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

  }

  static class GetTreasuryOutboundPaymentsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPayment response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of an existing OutboundPayment by passing the unique OutboundPayment
   * ID from either the OutboundPayment creation request or OutboundPayment list.</p>
   * See_Also: HTTP GET `/v1/treasury/outbound_payments/{id}`
   */
  void getTreasuryOutboundPaymentsId(
      GetTreasuryOutboundPaymentsIdParams params,
      GetTreasuryOutboundPaymentsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryOutboundPaymentsIdCancelParams {
    /**
     */
    string id;

  }

  static class PostTreasuryOutboundPaymentsIdCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPayment response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Cancel an OutboundPayment.</p>
   * See_Also: HTTP POST `/v1/treasury/outbound_payments/{id}/cancel`
   */
  void postTreasuryOutboundPaymentsIdCancel(
      PostTreasuryOutboundPaymentsIdCancelParams params,
      PostTreasuryOutboundPaymentsIdCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments/{id}/cancel");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryOutboundPaymentsParams {
    /**
     * Only return OutboundPayments sent to this customer.
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
     * Returns objects associated with this FinancialAccount.
     */
    string financial_account;

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
     * Only return OutboundPayments that have the given status: `processing`, `failed`, `posted`,
     * `returned`, or `canceled`.
     */
    string status;

  }

  static class GetTreasuryOutboundPaymentsResponseHandler : ResponseHandler {

    static class TreasuryOutboundPaymentsResourceOutboundPaymentList {
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
      TreasuryOutboundPayment[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPaymentsResourceOutboundPaymentList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPaymentsResourceOutboundPaymentList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of OutboundPayments sent from the specified FinancialAccount.</p>
   * See_Also: HTTP GET `/v1/treasury/outbound_payments`
   */
  void getTreasuryOutboundPayments(
      GetTreasuryOutboundPaymentsParams params,
      GetTreasuryOutboundPaymentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments");
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.financial_account.isNull)
      requestor.setQueryParam!("deepObject")("financial_account", params.financial_account);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryOutboundPaymentsBody {
    static class PaymentMethodData {
      @optional
      string type;

      @optional
      string[string] metadata;

      static class BillingDetailsInnerParams {
        @optional
        Json email;

        @optional
        string phone;

        @optional
        Json address;

        @optional
        string name;

      }

      @optional
      BillingDetailsInnerParams billing_details;

      static class PaymentMethodParam {
        @optional
        string account_holder_type;

        @optional
        string financial_connections_account;

        @optional
        string account_number;

        @optional
        string account_type;

        @optional
        string routing_number;

      }

      @optional
      PaymentMethodParam us_bank_account;

      @optional
      string financial_account;

    }

    /**
     * Hash used to generate the PaymentMethod to be used for this OutboundPayment. Exclusive with
     * `destination_payment_method`.
     */
    @optional
    PaymentMethodData destination_payment_method_data;

    /**
     * Amount (in cents) to be transferred.
     */
    @optional
    Nullable!(int) amount;

    /**
     * The description that appears on the receiving end for this OutboundPayment (for example, bank
     * statement for external bank transfer). Maximum 10 characters for `ach` payments, 140
     * characters for `wire` payments, or 500 characters for `stripe` network transfers. The default
     * value is `payment`.
     */
    @optional
    string statement_descriptor;

    static class EndUserDetailsParams {
      @optional
      Nullable!(bool) present;

      @optional
      string ip_address;

    }

    /**
     * End user details.
     */
    @optional
    EndUserDetailsParams end_user_details;

    /**
     * ID of the customer to whom the OutboundPayment is sent. Must match the Customer attached to
     * the `destination_payment_method` passed in.
     */
    @optional
    string customer;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * The PaymentMethod to use as the payment instrument for the OutboundPayment. Exclusive with
     * `destination_payment_method_data`.
     */
    @optional
    string destination_payment_method;

    static class PaymentMethodOptions {
      @optional
      Json us_bank_account;

    }

    /**
     * Payment method-specific configuration for this OutboundPayment.
     */
    @optional
    PaymentMethodOptions destination_payment_method_options;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The FinancialAccount to pull funds from.
     */
    @optional
    string financial_account;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

  }

  static class PostTreasuryOutboundPaymentsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPayment response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates an OutboundPayment.</p>
   * See_Also: HTTP POST `/v1/treasury/outbound_payments`
   */
  void postTreasuryOutboundPayments(
      PostTreasuryOutboundPaymentsBody requestBody,
      PostTreasuryOutboundPaymentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
