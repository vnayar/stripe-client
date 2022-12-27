// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_cardholders_service;

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
public import stripe.model.issuing.cardholder : IssuingCardholder;
/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/cardholders
 */
class V1IssuingCardholdersService {
  static class GetIssuingCardholdersCardholderParams {
    /**
     */
    Nullable!(Nullable!(string)) cardholder;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetIssuingCardholdersCardholderResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCardholder response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCardholder)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIssuingCardholdersCardholder(
      GetIssuingCardholdersCardholderParams params,
      GetIssuingCardholdersCardholderResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders/{cardholder}");
    if (!params.cardholder.isNull)
      requestor.setPathParam("cardholder", params.cardholder.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardholdersCardholderParams {
    /**
     */
    Nullable!(Nullable!(string)) cardholder;

  }

  static class PostIssuingCardholdersCardholderResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCardholder response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCardholder)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIssuingCardholdersCardholder(
      PostIssuingCardholdersCardholderParams params,
      PostIssuingCardholdersCardholderResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders/{cardholder}");
    if (!params.cardholder.isNull)
      requestor.setPathParam("cardholder", params.cardholder.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingCardholdersParams {
    /**
     * Only return cardholders that were created during the given date interval.
     */
    Nullable!(Json) created;

    /**
     * Only return cardholders that have the given email address.
     */
    Nullable!(Nullable!(string)) email;

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
     * Only return cardholders that have the given phone number.
     */
    Nullable!(Nullable!(string)) phone_number;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * Only return cardholders that have the given status. One of `active`, `inactive`, or
     * `blocked`.
     */
    Nullable!(Nullable!(string)) status;

    /**
     * Only return cardholders that have the given type. One of `individual` or `company`.
     */
    Nullable!(Nullable!(string)) type;

  }

  static class GetIssuingCardholdersResponseHandler : ResponseHandler {

    static class IssuingCardholderList {
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
      IssuingCardholder[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(IssuingCardholderList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCardholderList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIssuingCardholders(
      GetIssuingCardholdersParams params,
      GetIssuingCardholdersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders");
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.email.isNull)
      requestor.setQueryParam("email", params.email.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.phone_number.isNull)
      requestor.setQueryParam("phone_number", params.phone_number.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardholdersBody {
    /**
     * The cardholder's email address.
     */
    @optional
    Nullable!(string) email;

    static class AuthorizationControlsParamV2 {
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

      @optional
      Nullable!(string) spending_limits_currency;

    }

    /**
     * Rules that control spending across this cardholder's cards. Refer to our
     * [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
     */
    @optional
    AuthorizationControlsParamV2 spending_controls;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    static class CompanyParam {
      @optional
      Nullable!(string) tax_id;

    }

    /**
     * Additional information about a `company` cardholder.
     */
    @optional
    CompanyParam company;

    /**
     * The cardholder's name. This will be printed on cards issued to them. The maximum length of
     * this field is 24 characters. This field cannot contain any special characters or numbers.
     */
    @optional
    Nullable!(string) name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    static class BillingSpecs {
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

    }

    /**
     * The cardholder's billing address.
     */
    @optional
    BillingSpecs billing;

    static class IndividualParam {
      static class DateOfBirthSpecs {
        @optional
        Nullable!(int) year;

        @optional
        Nullable!(int) month;

        @optional
        Nullable!(int) day;

      }

      @optional
      DateOfBirthSpecs dob;

      @optional
      Nullable!(string) first_name;

      @optional
      Nullable!(string) last_name;

      static class PersonVerificationParam {
        static class PersonVerificationDocumentParam {
          @optional
          Nullable!(string) front;

          @optional
          Nullable!(string) back;

        }

        @optional
        PersonVerificationDocumentParam document;

      }

      @optional
      PersonVerificationParam verification;

    }

    /**
     * Additional information about an `individual` cardholder.
     */
    @optional
    IndividualParam individual;

    /**
     * The cardholder's phone number. This will be transformed to
     * [E.164](https://en.wikipedia.org/wiki/E.164) if it is not provided in that format already.
     * This is required for all cardholders who will be creating EU cards. See the [3D Secure
     * documentation](https://stripe.com/docs/issuing/3d-secure#when-is-3d-secure-applied) for more
     * details.
     */
    @optional
    Nullable!(string) phone_number;

    /**
     * One of `individual` or `company`.
     */
    @optional
    Nullable!(string) type;

    /**
     * Specifies whether to permit authorizations on this cardholder's cards. Defaults to `active`.
     */
    @optional
    Nullable!(string) status;

  }

  static class PostIssuingCardholdersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCardholder response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCardholder)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIssuingCardholders(
      PostIssuingCardholdersBody requestBody,
      PostIssuingCardholdersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
