// File automatically generated from OpenAPI spec.
module stripe.service.v1_billing_portal_sessions_service;

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

public import stripe.model.billing_portal.session : BillingPortalSession;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/billing_portal/sessions
 */
class V1BillingPortalSessionsService {
  static class PostBillingPortalSessionsBody {
    /**
     * The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the
     * customer’s `preferred_locales` or browser’s locale is used.
     */
    @optional
    string locale;

    static class FlowDataParam {
      @optional
      string type;

      static class FlowDataSubscriptionCancelParam {
        @optional
        string subscription;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      FlowDataSubscriptionCancelParam subscription_cancel;

      static class FlowDataAfterCompletionParam {
        @optional
        string type;

        static class AfterCompletionHostedConfirmationParam {
          @optional
          string custom_message;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AfterCompletionHostedConfirmationParam hosted_confirmation;

        static class AfterCompletionRedirectParam {
          @optional
          string return_url;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AfterCompletionRedirectParam redirect;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      FlowDataAfterCompletionParam after_completion;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about a specific flow for the customer to go through.
     */
    @optional
    FlowDataParam flow_data;

    /**
     * The default URL to redirect customers to when they click on the portal's link to return to
     * your website.
     */
    @optional
    string return_url;

    /**
     * The ID of an existing
     * [configuration](https://stripe.com/docs/api/customer_portal/configuration) to use for this
     * session, describing its functionality and features. If not specified, the session uses the
     * default configuration.
     */
    @optional
    string configuration;

    /**
     * The ID of an existing customer.
     */
    @optional
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The `on_behalf_of` account to use for this session. When specified, only subscriptions and
     * invoices with this `on_behalf_of` account appear in the portal. For more information, see the
     * [docs](https://stripe.com/docs/connect/charges-transfers#on-behalf-of). Use the [Accounts
     * API](https://stripe.com/docs/api/accounts/object#account_object-settings-branding) to modify
     * the `on_behalf_of` account's branding settings, which the portal displays.
     */
    @optional
    string on_behalf_of;

    mixin AddBuilder!(typeof(this));

  }

  static class PostBillingPortalSessionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BillingPortalSession response) handleResponse200;

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
        handleResponse200(deserializeJson!(BillingPortalSession)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a session of the customer portal.</p>
   * See_Also: HTTP POST `/v1/billing_portal/sessions`
   */
  void postBillingPortalSessions(
      PostBillingPortalSessionsBody requestBody,
      PostBillingPortalSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/billing_portal/sessions");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
