// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_cards_service;

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
public import stripe.model.issuing.card : IssuingCard;

/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/cards
 */
class V1IssuingCardsService {
  static class GetIssuingCardsCardParams {
    /**
     */
    Nullable!(Nullable!(string)) card;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

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
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
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
      requestor.setPathParam("card", params.card.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardsCardParams {
    /**
     */
    Nullable!(Nullable!(string)) card;

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
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
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
      requestor.setPathParam("card", params.card.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingCardsParams {
    /**
     * Only return cards belonging to the Cardholder with the provided ID.
     */
    Nullable!(Nullable!(string)) cardholder;

    /**
     * Only return cards that were issued during the given date interval.
     */
    Nullable!(Json) created;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Only return cards that have the given expiration month.
     */
    Nullable!(Nullable!(int)) exp_month;

    /**
     * Only return cards that have the given expiration year.
     */
    Nullable!(Nullable!(int)) exp_year;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * Only return cards that have the given last four digits.
     */
    Nullable!(Nullable!(string)) last4;

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
     * Only return cards that have the given status. One of `active`, `inactive`, or `canceled`.
     */
    Nullable!(Nullable!(string)) status;

    /**
     * Only return cards that have the given type. One of `virtual` or `physical`.
     */
    Nullable!(Nullable!(string)) type;

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
      Nullable!(string) object;

      @optional
      IssuingCard[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(IssuingCardList)(res.readJson()));
        return;
      }
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
      requestor.setQueryParam("cardholder", params.cardholder.get.to!string);
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.exp_month.isNull)
      requestor.setQueryParam("exp_month", params.exp_month.get.to!string);
    if (!params.exp_year.isNull)
      requestor.setQueryParam("exp_year", params.exp_year.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.last4.isNull)
      requestor.setQueryParam("last4", params.last4.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardsBody {
    static class AuthorizationControlsParam {
      static class SpendingLimitsParam {
        @optional
        Nullable!(int) amount;

        @optional
        Nullable!(string)[] categories;

        @optional
        Nullable!(string) interval;

      }

      @optional
      SpendingLimitsParam[] spending_limits;

      @optional
      Nullable!(string)[] allowed_categories;

      @optional
      Nullable!(string)[] blocked_categories;

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
    Nullable!(string) replacement_for;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * The currency for the card.
     */
    @optional
    Nullable!(string) currency;

    /**
     * If `replacement_for` is specified, this should indicate why that card is being replaced.
     */
    @optional
    Nullable!(string) replacement_reason;

    /**
     * The [Cardholder](https://stripe.com/docs/api#issuing_cardholder_object) object with which the
     * card will be associated.
     */
    @optional
    Nullable!(string) cardholder;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    @optional
    Nullable!(string) financial_account;

    /**
     * The type of card to issue. Possible values are `physical` or `virtual`.
     */
    @optional
    Nullable!(string) type;

    static class ShippingSpecs {
      @optional
      Nullable!(string) service;

      @optional
      Nullable!(bool) require_signature;

      @optional
      Nullable!(string) name;

      static class RequiredAddress {
        @optional
        Nullable!(string) line1;

        @optional
        Nullable!(string) line2;

        @optional
        Nullable!(string) country;

        @optional
        Nullable!(string) postal_code;

        @optional
        Nullable!(string) city;

        @optional
        Nullable!(string) state;

      }

      @optional
      RequiredAddress address;

      @optional
      Nullable!(string) type;

      @optional
      Nullable!(string) phone_number;

      static class CustomsParam {
        @optional
        Nullable!(string) eori_number;

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
    Nullable!(string) status;

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
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
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
