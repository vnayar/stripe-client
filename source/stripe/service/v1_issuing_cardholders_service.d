// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_cardholders_service;

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
public import stripe.model.issuing.cardholder : IssuingCardholder;

/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/cardholders
 */
class V1IssuingCardholdersService {
  static class GetIssuingCardholdersCardholderParams {
    /**
     */
    string cardholder;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingCardholder)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves an Issuing <code>Cardholder</code> object.</p>
   * See_Also: HTTP GET `/v1/issuing/cardholders/{cardholder}`
   */
  void getIssuingCardholdersCardholder(
      GetIssuingCardholdersCardholderParams params,
      GetIssuingCardholdersCardholderResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders/{cardholder}");
    if (!params.cardholder.isNull)
      requestor.setPathParam("cardholder", params.cardholder);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardholdersCardholderParams {
    /**
     */
    string cardholder;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingCardholder)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified Issuing <code>Cardholder</code> object by setting the values of the
   * parameters passed. Any parameters not provided will be left unchanged.</p>
   * See_Also: HTTP POST `/v1/issuing/cardholders/{cardholder}`
   */
  void postIssuingCardholdersCardholder(
      PostIssuingCardholdersCardholderParams params,
      PostIssuingCardholdersCardholderResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders/{cardholder}");
    if (!params.cardholder.isNull)
      requestor.setPathParam("cardholder", params.cardholder);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingCardholdersParams {
    /**
     * Only return cardholders that were created during the given date interval.
     */
    Json created;

    /**
     * Only return cardholders that have the given email address.
     */
    string email;

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
     * Only return cardholders that have the given phone number.
     */
    string phone_number;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * Only return cardholders that have the given status. One of `active`, `inactive`, or
     * `blocked`.
     */
    string status;

    /**
     * Only return cardholders that have the given type. One of `individual` or `company`.
     */
    string type;

    mixin AddBuilder!(typeof(this));

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
      string object;

      @optional
      IssuingCardholder[] data;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingCardholderList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of Issuing <code>Cardholder</code> objects. The objects are sorted in
   * descending order by creation date, with the most recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/issuing/cardholders`
   */
  void getIssuingCardholders(
      GetIssuingCardholdersParams params,
      GetIssuingCardholdersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.email.isNull)
      requestor.setQueryParam!("deepObject")("email", params.email);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.phone_number.isNull)
      requestor.setQueryParam!("deepObject")("phone_number", params.phone_number);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    if (!params.type.isNull)
      requestor.setQueryParam!("deepObject")("type", params.type);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingCardholdersBody {
    /**
     * The cardholder's email address.
     */
    @optional
    string email;

    static class AuthorizationControlsParamV2 {
      static class SpendingLimitsParam {
        @optional
        Nullable!(int) amount;

        @optional
        string[] categories;

        @optional
        string interval;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SpendingLimitsParam[] spending_limits;

      @optional
      string[] allowed_categories;

      @optional
      string[] blocked_categories;

      @optional
      string spending_limits_currency;

      mixin AddBuilder!(typeof(this));

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
    string[string] metadata;

    static class CompanyParam {
      @optional
      string tax_id;

      mixin AddBuilder!(typeof(this));

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
    string name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class BillingSpecs {
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

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RequiredAddress address;

      mixin AddBuilder!(typeof(this));

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

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DateOfBirthSpecs dob;

      @optional
      string first_name;

      @optional
      string last_name;

      static class PersonVerificationParam {
        static class PersonVerificationDocumentParam {
          @optional
          string front;

          @optional
          string back;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        PersonVerificationDocumentParam document;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationParam verification;

      mixin AddBuilder!(typeof(this));

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
    string phone_number;

    /**
     * One of `individual` or `company`.
     */
    @optional
    string type;

    /**
     * Specifies whether to permit authorizations on this cardholder's cards. Defaults to `active`.
     */
    @optional
    string status;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingCardholder)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new Issuing <code>Cardholder</code> object that can be issued cards.</p>
   * See_Also: HTTP POST `/v1/issuing/cardholders`
   */
  void postIssuingCardholders(
      PostIssuingCardholdersBody requestBody,
      PostIssuingCardholdersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/cardholders");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
