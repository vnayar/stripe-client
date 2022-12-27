// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_outbound_payments_service;

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
public import stripe.model.treasury.outbound_payment : TreasuryOutboundPayment;
/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/outbound_payments
 */
class V1TreasuryOutboundPaymentsService {
  static class GetTreasuryOutboundPaymentsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryOutboundPaymentsId(
      GetTreasuryOutboundPaymentsIdParams params,
      GetTreasuryOutboundPaymentsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryOutboundPaymentsIdCancelParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTreasuryOutboundPaymentsIdCancel(
      PostTreasuryOutboundPaymentsIdCancelParams params,
      PostTreasuryOutboundPaymentsIdCancelResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments/{id}/cancel");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryOutboundPaymentsParams {
    /**
     * Only return OutboundPayments sent to this customer.
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
     * Returns objects associated with this FinancialAccount.
     */
    Nullable!(Nullable!(string)) financial_account;

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
     * Only return OutboundPayments that have the given status: `processing`, `failed`, `posted`,
     * `returned`, or `canceled`.
     */
    Nullable!(Nullable!(string)) status;

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
      Nullable!(string) object;

      /**
       * Details about each object.
       */
      @optional
      TreasuryOutboundPayment[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPaymentsResourceOutboundPaymentList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryOutboundPayments(
      GetTreasuryOutboundPaymentsParams params,
      GetTreasuryOutboundPaymentsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments");
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.financial_account.isNull)
      requestor.setQueryParam("financial_account", params.financial_account.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryOutboundPaymentsBody {
    static class PaymentMethodData {
      @optional
      Nullable!(string) type;

      @optional
      Nullable!(string)[string] metadata;

      static class BillingDetailsInnerParams {
        @optional
        Json email;

        @optional
        Nullable!(string) phone;

        @optional
        Json address;

        @optional
        Nullable!(string) name;

      }

      @optional
      BillingDetailsInnerParams billing_details;

      static class PaymentMethodParam {
        @optional
        Nullable!(string) account_holder_type;

        @optional
        Nullable!(string) financial_connections_account;

        @optional
        Nullable!(string) account_number;

        @optional
        Nullable!(string) account_type;

        @optional
        Nullable!(string) routing_number;

      }

      @optional
      PaymentMethodParam us_bank_account;

      @optional
      Nullable!(string) financial_account;

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
    Nullable!(string) statement_descriptor;

    static class EndUserDetailsParams {
      @optional
      Nullable!(bool) present;

      @optional
      Nullable!(string) ip_address;

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
    Nullable!(string) customer;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    Nullable!(string) currency;

    /**
     * The PaymentMethod to use as the payment instrument for the OutboundPayment. Exclusive with
     * `destination_payment_method_data`.
     */
    @optional
    Nullable!(string) destination_payment_method;

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
    Nullable!(string)[] expand;

    /**
     * The FinancialAccount to pull funds from.
     */
    @optional
    Nullable!(string) financial_account;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTreasuryOutboundPayments(
      PostTreasuryOutboundPaymentsBody requestBody,
      PostTreasuryOutboundPaymentsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_payments");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
