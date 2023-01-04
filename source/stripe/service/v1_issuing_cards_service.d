// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_cards_service;

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
public import stripe.model.issuing.card : IssuingCard;

/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/cards
 */
class V1IssuingCardsService {
  static class GetIssuingCardsCardParams {
    /**
     */
    string card;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

  }

  static class GetIssuingCardsCardResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves an Issuing <code>Card</code> object.</p>
   * See_Also: HTTP GET `/v1/issuing/cards/{card}`
   */
  void getIssuingCardsCard(
      GetIssuingCardsCardParams params,
      GetIssuingCardsCardResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/cards/{card}");
    if (!params.card.isNull)
      requestor.setPathParam("card", params.card);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardsCardParams {
    /**
     */
    string card;

  }

  static class PostIssuingCardsCardResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the specified Issuing <code>Card</code> object by setting the values of the
   * parameters passed. Any parameters not provided will be left unchanged.</p>
   * See_Also: HTTP POST `/v1/issuing/cards/{card}`
   */
  void postIssuingCardsCard(
      PostIssuingCardsCardParams params,
      PostIssuingCardsCardResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/cards/{card}");
    if (!params.card.isNull)
      requestor.setPathParam("card", params.card);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingCardsParams {
    /**
     * Only return cards belonging to the Cardholder with the provided ID.
     */
    string cardholder;

    /**
     * Only return cards that were issued during the given date interval.
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
     * Only return cards that have the given expiration month.
     */
    Nullable!(int) exp_month;

    /**
     * Only return cards that have the given expiration year.
     */
    Nullable!(int) exp_year;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * Only return cards that have the given last four digits.
     */
    string last4;

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
     * Only return cards that have the given status. One of `active`, `inactive`, or `canceled`.
     */
    string status;

    /**
     * Only return cards that have the given type. One of `virtual` or `physical`.
     */
    string type;

  }

  static class GetIssuingCardsResponseHandler : ResponseHandler {

    static class IssuingCardList {
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
      IssuingCard[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(IssuingCardList response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingCardList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of Issuing <code>Card</code> objects. The objects are sorted in descending
   * order by creation date, with the most recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/issuing/cards`
   */
  void getIssuingCards(
      GetIssuingCardsParams params,
      GetIssuingCardsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/cards");
    if (!params.cardholder.isNull)
      requestor.setQueryParam!("deepObject")("cardholder", params.cardholder);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.exp_month.isNull)
      requestor.setQueryParam!("deepObject")("exp_month", params.exp_month);
    if (!params.exp_year.isNull)
      requestor.setQueryParam!("deepObject")("exp_year", params.exp_year);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.last4.isNull)
      requestor.setQueryParam!("deepObject")("last4", params.last4);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    if (!params.type.isNull)
      requestor.setQueryParam!("deepObject")("type", params.type);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardsBody {
    static class AuthorizationControlsParam {
      static class SpendingLimitsParam {
        @optional
        Nullable!(int) amount;

        @optional
        string[] categories;

        @optional
        string interval;

      }

      @optional
      SpendingLimitsParam[] spending_limits;

      @optional
      string[] allowed_categories;

      @optional
      string[] blocked_categories;

    }

    /**
     * Rules that control spending for this card. Refer to our
     * [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
     */
    @optional
    AuthorizationControlsParam spending_controls;

    /**
     * The card this is meant to be a replacement for (if any).
     */
    @optional
    string replacement_for;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * The currency for the card.
     */
    @optional
    string currency;

    /**
     * If `replacement_for` is specified, this should indicate why that card is being replaced.
     */
    @optional
    string replacement_reason;

    /**
     * The [Cardholder](https://stripe.com/docs/api#issuing_cardholder_object) object with which the
     * card will be associated.
     */
    @optional
    string cardholder;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    @optional
    string financial_account;

    /**
     * The type of card to issue. Possible values are `physical` or `virtual`.
     */
    @optional
    string type;

    static class ShippingSpecs {
      @optional
      string service;

      @optional
      Nullable!(bool) require_signature;

      @optional
      string name;

      static class RequiredAddress {
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

      }

      @optional
      RequiredAddress address;

      @optional
      string type;

      @optional
      string phone_number;

      static class CustomsParam {
        @optional
        string eori_number;

      }

      @optional
      CustomsParam customs;

    }

    /**
     * The address where the card will be shipped.
     */
    @optional
    ShippingSpecs shipping;

    /**
     * Whether authorizations can be approved on this card. Defaults to `inactive`.
     */
    @optional
    string status;

  }

  static class PostIssuingCardsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

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
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates an Issuing <code>Card</code> object.</p>
   * See_Also: HTTP POST `/v1/issuing/cards`
   */
  void postIssuingCards(
      PostIssuingCardsBody requestBody,
      PostIssuingCardsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/cards");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
