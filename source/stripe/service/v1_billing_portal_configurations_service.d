// File automatically generated from OpenAPI spec.
module stripe.service.v1_billing_portal_configurations_service;

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

public import stripe.model.billing_portal.configuration : BillingPortalConfiguration;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/billing_portal/configurations
 */
class V1BillingPortalConfigurationsService {
  static class GetBillingPortalConfigurationsConfigurationParams {
    /**
     */
    string configuration;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

  }

  static class GetBillingPortalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BillingPortalConfiguration response) handleResponse200;

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
        handleResponse200(deserializeJson!(BillingPortalConfiguration)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a configuration that describes the functionality of the customer portal.</p>
   * See_Also: HTTP GET `/v1/billing_portal/configurations/{configuration}`
   */
  void getBillingPortalConfigurationsConfiguration(
      GetBillingPortalConfigurationsConfigurationParams params,
      GetBillingPortalConfigurationsConfigurationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/billing_portal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostBillingPortalConfigurationsConfigurationParams {
    /**
     */
    string configuration;

  }

  static class PostBillingPortalConfigurationsConfigurationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BillingPortalConfiguration response) handleResponse200;

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
        handleResponse200(deserializeJson!(BillingPortalConfiguration)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates a configuration that describes the functionality of the customer portal.</p>
   * See_Also: HTTP POST `/v1/billing_portal/configurations/{configuration}`
   */
  void postBillingPortalConfigurationsConfiguration(
      PostBillingPortalConfigurationsConfigurationParams params,
      PostBillingPortalConfigurationsConfigurationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/billing_portal/configurations/{configuration}");
    if (!params.configuration.isNull)
      requestor.setPathParam("configuration", params.configuration);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetBillingPortalConfigurationsParams {
    /**
     * Only return configurations that are active or inactive (e.g., pass `true` to only list active
     * configurations).
     */
    Nullable!(bool) active;

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
     * Only return the default or non-default configurations (e.g., pass `true` to only list the
     * default configuration).
     */
    Nullable!(bool) is_default;

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

  }

  static class GetBillingPortalConfigurationsResponseHandler : ResponseHandler {

    static class PortalConfigurationList {
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
      BillingPortalConfiguration[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(PortalConfigurationList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PortalConfigurationList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of configurations that describe the functionality of the customer portal.</p>
   * See_Also: HTTP GET `/v1/billing_portal/configurations`
   */
  void getBillingPortalConfigurations(
      GetBillingPortalConfigurationsParams params,
      GetBillingPortalConfigurationsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/billing_portal/configurations");
    if (!params.active.isNull)
      requestor.setQueryParam!("deepObject")("active", params.active);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.is_default.isNull)
      requestor.setQueryParam!("deepObject")("is_default", params.is_default);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostBillingPortalConfigurationsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    static class BusinessProfileCreateParam {
      @optional
      string terms_of_service_url;

      @optional
      string privacy_policy_url;

      @optional
      string headline;

    }

    /**
     * The business information shown to customers in the portal.
     */
    @optional
    BusinessProfileCreateParam business_profile;

    /**
     * The default URL to redirect customers to when they click on the portal's link to return to
     * your website. This can be
     * [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session
     * -return_url) when creating the session.
     */
    @optional
    Json default_return_url;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class FeaturesCreationParam {
      static class CustomerUpdateCreationParam {
        @optional
        Nullable!(bool) enabled;

        @optional
        Json allowed_updates;

      }

      @optional
      CustomerUpdateCreationParam customer_update;

      static class SubscriptionUpdateCreationParam {
        @optional
        Nullable!(bool) enabled;

        @optional
        string proration_behavior;

        @optional
        Json default_allowed_updates;

        @optional
        Json products;

      }

      @optional
      SubscriptionUpdateCreationParam subscription_update;

      static class InvoiceListParam {
        @optional
        Nullable!(bool) enabled;

      }

      @optional
      InvoiceListParam invoice_history;

      static class PaymentMethodUpdateParam {
        @optional
        Nullable!(bool) enabled;

      }

      @optional
      PaymentMethodUpdateParam payment_method_update;

      static class SubscriptionCancelCreationParam {
        static class SubscriptionCancellationReasonCreationParam {
          @optional
          Nullable!(bool) enabled;

          @optional
          Json options;

        }

        @optional
        SubscriptionCancellationReasonCreationParam cancellation_reason;

        @optional
        Nullable!(bool) enabled;

        @optional
        string proration_behavior;

        @optional
        string mode;

      }

      @optional
      SubscriptionCancelCreationParam subscription_cancel;

      static class SubscriptionPauseParam {
        @optional
        Nullable!(bool) enabled;

      }

      @optional
      SubscriptionPauseParam subscription_pause;

    }

    /**
     * Information about the features available in the portal.
     */
    @optional
    FeaturesCreationParam features;

    static class LoginPageCreateParam {
      @optional
      Nullable!(bool) enabled;

    }

    /**
     * The hosted login page for this configuration. Learn more about the portal login page in our
     * [integration
     * docs](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal#share).
     */
    @optional
    LoginPageCreateParam login_page;

  }

  static class PostBillingPortalConfigurationsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BillingPortalConfiguration response) handleResponse200;

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
        handleResponse200(deserializeJson!(BillingPortalConfiguration)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a configuration that describes the functionality and behavior of a PortalSession</p>
   * See_Also: HTTP POST `/v1/billing_portal/configurations`
   */
  void postBillingPortalConfigurations(
      PostBillingPortalConfigurationsBody requestBody,
      PostBillingPortalConfigurationsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/billing_portal/configurations");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
