// File automatically generated from OpenAPI spec.
module stripe.service.v1_terminal_readers_service;

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

public import stripe.model.deleted_terminal.reader : DeletedTerminalReader;
public import stripe.model.error : Error_;
public import stripe.model.terminal.reader : TerminalReader;
/**
 * Service to make REST API calls to paths beginning with: /v1/terminal/readers
 */
class V1TerminalReadersService {
  static class GetTerminalReadersReaderParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class GetTerminalReadersReaderResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTerminalReadersReader(
      GetTerminalReadersReaderParams params,
      GetTerminalReadersReaderResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalReadersReaderParams {
    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class PostTerminalReadersReaderResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalReadersReader(
      PostTerminalReadersReaderParams params,
      PostTerminalReadersReaderResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteTerminalReadersReaderParams {
    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class DeleteTerminalReadersReaderResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedTerminalReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedTerminalReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteTerminalReadersReader(
      DeleteTerminalReadersReaderParams params,
      DeleteTerminalReadersReaderResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalReadersReaderProcessPaymentIntentParams {
    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class PostTerminalReadersReaderProcessPaymentIntentBody {
    static class ProcessConfig {
      static class TippingConfig {
        @optional
        Nullable!(int) amount_eligible;

      }

      @optional
      TippingConfig tipping;

      @optional
      Nullable!(bool) skip_tipping;

    }

    /**
     * Configuration overrides
     */
    @optional
    ProcessConfig process_config;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * PaymentIntent ID
     */
    @optional
    Nullable!(string) payment_intent;

  }

  static class PostTerminalReadersReaderProcessPaymentIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalReadersReaderProcessPaymentIntent(
      PostTerminalReadersReaderProcessPaymentIntentParams params,
      PostTerminalReadersReaderProcessPaymentIntentBody requestBody,
      PostTerminalReadersReaderProcessPaymentIntentResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}/process_payment_intent");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTerminalReadersReaderProcessSetupIntentParams {
    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class PostTerminalReadersReaderProcessSetupIntentBody {
    /**
     * Customer Consent Collected
     */
    @optional
    Nullable!(bool) customer_consent_collected;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * SetupIntent ID
     */
    @optional
    Nullable!(string) setup_intent;

  }

  static class PostTerminalReadersReaderProcessSetupIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalReadersReaderProcessSetupIntent(
      PostTerminalReadersReaderProcessSetupIntentParams params,
      PostTerminalReadersReaderProcessSetupIntentBody requestBody,
      PostTerminalReadersReaderProcessSetupIntentResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}/process_setup_intent");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTerminalReadersReaderSetReaderDisplayParams {
    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class PostTerminalReadersReaderSetReaderDisplayBody {
    /**
     * Type
     */
    @optional
    Nullable!(string) type;

    static class Cart {
      @optional
      Nullable!(string) currency;

      @optional
      Nullable!(int) tax;

      @optional
      Nullable!(int) total;

      static class LineItem {
        @optional
        Nullable!(string) description;

        @optional
        Nullable!(int) amount;

        @optional
        Nullable!(int) quantity;

      }

      @optional
      LineItem[] line_items;

    }

    /**
     * Cart
     */
    @optional
    Cart cart;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

  }

  static class PostTerminalReadersReaderSetReaderDisplayResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalReadersReaderSetReaderDisplay(
      PostTerminalReadersReaderSetReaderDisplayParams params,
      PostTerminalReadersReaderSetReaderDisplayBody requestBody,
      PostTerminalReadersReaderSetReaderDisplayResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}/set_reader_display");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTerminalReadersReaderCancelActionParams {
    /**
     */
    Nullable!(Nullable!(string)) reader;

  }

  static class PostTerminalReadersReaderCancelActionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalReadersReaderCancelAction(
      PostTerminalReadersReaderCancelActionParams params,
      PostTerminalReadersReaderCancelActionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/readers/{reader}/cancel_action");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTerminalReadersParams {
    /**
     * Filters readers by device type
     */
    Nullable!(Nullable!(string)) device_type;

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
     * A location ID to filter the response list to only readers at the specific location
     */
    Nullable!(Nullable!(string)) location;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * A status filter to filter readers to only offline or online readers
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetTerminalReadersResponseHandler : ResponseHandler {

    static class TerminalReaderRetrieveReader {
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
       * A list of readers
       */
      @optional
      TerminalReader[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TerminalReaderRetrieveReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalReaderRetrieveReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTerminalReaders(
      GetTerminalReadersParams params,
      GetTerminalReadersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/terminal/readers");
    if (!params.device_type.isNull)
      requestor.setQueryParam("device_type", params.device_type.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.location.isNull)
      requestor.setQueryParam("location", params.location.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTerminalReadersBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The location to assign the reader to.
     */
    @optional
    Nullable!(string) location;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * Custom label given to the reader for easier identification. If no label is specified, the
     * registration code will be used.
     */
    @optional
    Nullable!(string) label;

    /**
     * A code generated by the reader used for registering to an account.
     */
    @optional
    Nullable!(string) registration_code;

  }

  static class PostTerminalReadersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalReader response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalReader)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalReaders(
      PostTerminalReadersBody requestBody,
      PostTerminalReadersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/readers");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
