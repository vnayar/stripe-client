// File automatically generated from OpenAPI spec.
module stripe.service.v1_sources_service;

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
public import stripe.model.source : Source;
public import stripe.model.source_mandate_notification : SourceMandateNotification;
public import stripe.model.source_transaction : SourceTransaction;

/**
 * Service to make REST API calls to paths beginning with: /v1/sources
 */
class V1SourcesService {
  static class GetSourcesSourceMandateNotificationsMandateNotificationParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string mandate_notification;

    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceMandateNotificationsMandateNotificationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SourceMandateNotification response) handleResponse200;

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
        handleResponse200(deserializeJson!(SourceMandateNotification)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a new Source MandateNotification.</p>
   * See_Also: HTTP GET `/v1/sources/{source}/mandate_notifications/{mandate_notification}`
   */
  void getSourcesSourceMandateNotificationsMandateNotification(
      GetSourcesSourceMandateNotificationsMandateNotificationParams params,
      GetSourcesSourceMandateNotificationsMandateNotificationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/mandate_notifications/{mandate_notification}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.mandate_notification.isNull)
      requestor.setPathParam("mandate_notification", params.mandate_notification);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesBody {
    /**
     * Amount associated with the source. This is the amount for which the source will be chargeable
     * once ready. Required for `single_use` sources. Not supported for `receiver` type sources,
     * where charge amount may not be specified until funds land.
     */
    @optional
    Nullable!(int) amount;

    /**
     * An arbitrary string to be displayed on your customer's statement. As an example, if your
     * website is `RunClub` and the item you're charging for is a race ticket, you may want to
     * specify a `statement_descriptor` of `RunClub 5K race ticket.` While many payment types will
     * display this information, some may not display it at all.
     */
    @optional
    string statement_descriptor;

    /**
     * The source to share.
     */
    @optional
    string original_source;

    /**
     * The `Customer` to whom the original source is attached to. Must be set when the original
     * source is not a `Source` (e.g., `Card`).
     */
    @optional
    string customer;

    @optional
    string[string] metadata;

    /**
     * Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with
     * the source. This is the currency for which the source will be chargeable once ready.
     */
    @optional
    string currency;

    @optional
    string usage;

    static class Owner {
      @optional
      string email;

      @optional
      string phone;

      static class SourceAddress {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SourceAddress address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the owner of the payment instrument that may be used or required by
     * particular source types.
     */
    @optional
    Owner owner;

    /**
     * An optional token used to create the source. When passed, token properties will override
     * source parameters.
     */
    @optional
    string token;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class RedirectParams {
      @optional
      string return_url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Parameters required for the redirect flow. Required if the source is authenticated by a
     * redirect (`flow` is `redirect`).
     */
    @optional
    RedirectParams redirect;

    static class ShallowOrderSpecs {
      static class OrderShipping {
        @optional
        string phone;

        @optional
        string carrier;

        static class Address {
          @optional
          string line1;

          @optional
          string line2;

          @optional
          string country;

          @optional
          string postal_code;

          @optional
          string city;

          @optional
          string state;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Address address;

        @optional
        string tracking_number;

        @optional
        string name;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OrderShipping shipping;

      static class OrderItemSpecs {
        @optional
        string description;

        @optional
        string type;

        @optional
        Nullable!(int) amount;

        @optional
        string currency;

        @optional
        Nullable!(int) quantity;

        @optional
        string parent;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OrderItemSpecs[] items;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the items and shipping associated with the source. Required for
     * transactional credit (for example Klarna) sources before you can charge it.
     */
    @optional
    ShallowOrderSpecs source_order;

    /**
     * The `type` of the source to create. Required unless `customer` and `original_source` are
     * specified (see the [Cloning card
     * Sources](https://stripe.com/docs/sources/connect#cloning-card-sources) guide)
     */
    @optional
    string type;

    /**
     * The authentication `flow` of the source to create. `flow` is one of `redirect`, `receiver`,
     * `code_verification`, `none`. It is generally inferred unless a type supports multiple flows.
     */
    @optional
    string flow;

    static class ReceiverParams {
      @optional
      string refund_attributes_method;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Optional parameters for the receiver flow. Can be set only if the source is a receiver
     * (`flow` is `receiver`).
     */
    @optional
    ReceiverParams receiver;

    static class MandateParams {
      @optional
      string notification_method;

      @optional
      Json amount;

      @optional
      string currency;

      static class MandateAcceptanceParams {
        @optional
        string user_agent;

        static class MandateOfflineAcceptanceParams {
          @optional
          string contact_email;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        MandateOfflineAcceptanceParams offline;

        @optional
        Nullable!(long) date;

        static class MandateOnlineAcceptanceParams {
          @optional
          string ip;

          @optional
          Nullable!(long) date;

          @optional
          string user_agent;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        MandateOnlineAcceptanceParams online;

        @optional
        string type;

        @optional
        string ip;

        @optional
        string status;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      MandateAcceptanceParams acceptance;

      @optional
      string interval;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about a mandate possibility attached to a source object (generally for bank
     * debits) as well as its acceptance status.
     */
    @optional
    MandateParams mandate;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new source object.</p>
   * See_Also: HTTP POST `/v1/sources`
   */
  void postSources(
      PostSourcesBody requestBody,
      PostSourcesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSourcesSourceParams {
    /**
     * The client secret of the source. Required if a publishable key is used to retrieve the
     * source.
     */
    string client_secret;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves an existing source object. Supply the unique source ID from a source creation
   * request and Stripe will return the corresponding up-to-date source object information.</p>
   * See_Also: HTTP GET `/v1/sources/{source}`
   */
  void getSourcesSource(
      GetSourcesSourceParams params,
      GetSourcesSourceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam!("deepObject")("client_secret", params.client_secret);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesSourceParams {
    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceBody {
    static class OrderParams {
      static class OrderShipping {
        @optional
        string phone;

        @optional
        string carrier;

        static class Address {
          @optional
          string line1;

          @optional
          string line2;

          @optional
          string country;

          @optional
          string postal_code;

          @optional
          string city;

          @optional
          string state;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Address address;

        @optional
        string tracking_number;

        @optional
        string name;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OrderShipping shipping;

      static class OrderItemSpecs {
        @optional
        string description;

        @optional
        string type;

        @optional
        Nullable!(int) amount;

        @optional
        string currency;

        @optional
        Nullable!(int) quantity;

        @optional
        string parent;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OrderItemSpecs[] items;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the items and shipping associated with the source. Required for
     * transactional credit (for example Klarna) sources before you can charge it.
     */
    @optional
    OrderParams source_order;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Amount associated with the source.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class Owner {
      @optional
      string email;

      @optional
      string phone;

      static class SourceAddress {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SourceAddress address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the owner of the payment instrument that may be used or required by
     * particular source types.
     */
    @optional
    Owner owner;

    static class MandateParams {
      @optional
      string notification_method;

      @optional
      Json amount;

      @optional
      string currency;

      static class MandateAcceptanceParams {
        @optional
        string user_agent;

        static class MandateOfflineAcceptanceParams {
          @optional
          string contact_email;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        MandateOfflineAcceptanceParams offline;

        @optional
        Nullable!(long) date;

        static class MandateOnlineAcceptanceParams {
          @optional
          string ip;

          @optional
          Nullable!(long) date;

          @optional
          string user_agent;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        MandateOnlineAcceptanceParams online;

        @optional
        string type;

        @optional
        string ip;

        @optional
        string status;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      MandateAcceptanceParams acceptance;

      @optional
      string interval;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about a mandate possibility attached to a source object (generally for bank
     * debits) as well as its acceptance status.
     */
    @optional
    MandateParams mandate;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified source by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged.</p>
   * <p>This request accepts the <code>metadata</code> and <code>owner</code> as arguments. It is
   * also possible to update type specific information for selected payment methods. Please refer to
   * our <a href="/docs/sources">payment method guides</a> for more detail.</p>
   * See_Also: HTTP POST `/v1/sources/{source}`
   */
  void postSourcesSource(
      PostSourcesSourceParams params,
      PostSourcesSourceBody requestBody,
      PostSourcesSourceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources/{source}");
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSourcesSourceSourceTransactionsParams {
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
     */
    string source;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceSourceTransactionsResponseHandler : ResponseHandler {

    static class ApmsSourcesSourceTransactionList {
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
      SourceTransaction[] data;

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
    void delegate(ApmsSourcesSourceTransactionList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApmsSourcesSourceTransactionList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>List source transactions for a given source.</p>
   * See_Also: HTTP GET `/v1/sources/{source}/source_transactions`
   */
  void getSourcesSourceSourceTransactions(
      GetSourcesSourceSourceTransactionsParams params,
      GetSourcesSourceSourceTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/source_transactions");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSourcesSourceVerifyParams {
    /**
     */
    string source;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceVerifyBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The values needed to verify the source.
     */
    @optional
    string[] values;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSourcesSourceVerifyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Source response) handleResponse200;

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
        handleResponse200(deserializeJson!(Source)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Verify a given source.</p>
   * See_Also: HTTP POST `/v1/sources/{source}/verify`
   */
  void postSourcesSourceVerify(
      PostSourcesSourceVerifyParams params,
      PostSourcesSourceVerifyBody requestBody,
      PostSourcesSourceVerifyResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/sources/{source}/verify");
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSourcesSourceSourceTransactionsSourceTransactionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string source;

    /**
     */
    string source_transaction;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSourcesSourceSourceTransactionsSourceTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SourceTransaction response) handleResponse200;

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
        handleResponse200(deserializeJson!(SourceTransaction)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve an existing source transaction object. Supply the unique source ID from a source
   * creation request and the source transaction ID and Stripe will return the corresponding
   * up-to-date source object information.</p>
   * See_Also: HTTP GET `/v1/sources/{source}/source_transactions/{source_transaction}`
   */
  void getSourcesSourceSourceTransactionsSourceTransaction(
      GetSourcesSourceSourceTransactionsSourceTransactionParams params,
      GetSourcesSourceSourceTransactionsSourceTransactionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/sources/{source}/source_transactions/{source_transaction}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.source.isNull)
      requestor.setPathParam("source", params.source);
    if (!params.source_transaction.isNull)
      requestor.setPathParam("source_transaction", params.source_transaction);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
