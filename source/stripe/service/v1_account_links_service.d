// File automatically generated from OpenAPI spec.
module stripe.service.v1_account_links_service;

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

public import stripe.model.account_link : AccountLink;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/account_links
 */
class V1AccountLinksService {
  static class PostAccountLinksBody {
    /**
     * The type of account link the user is requesting. Possible values are `account_onboarding` or
     * `account_update`.
     */
    @optional
    string type;

    /**
     * The URL the user will be redirected to if the account link is expired, has been
     * previously-visited, or is otherwise invalid. The URL you specify should attempt to generate a
     * new account link with the same parameters used to create the original account link, then
     * redirect the user to the new account link's URL so they can continue with Connect Onboarding.
     * If a new account link cannot be generated or the redirect fails you should display a useful
     * error to the user.
     */
    @optional
    string refresh_url;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The identifier of the account to create an account link for.
     */
    @optional
    string account;

    /**
     * Which information the platform needs to collect from the user. One of `currently_due` or
     * `eventually_due`. Default is `currently_due`.
     */
    @optional
    string collect;

    /**
     * The URL that the user will be redirected to upon leaving or completing the linked flow.
     */
    @optional
    string return_url;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountLinksResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(AccountLink response) handleResponse200;

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
        handleResponse200(deserializeJson!(AccountLink)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates an AccountLink object that includes a single-use Stripe URL that the platform can
   * redirect their user to in order to take them through the Connect Onboarding flow.</p>
   * See_Also: HTTP POST `/v1/account_links`
   */
  void postAccountLinks(
      PostAccountLinksBody requestBody,
      PostAccountLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/account_links");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
