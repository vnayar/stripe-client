// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoices_search_service;

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
public import stripe.model.invoice : Invoice;

/**
 * Service to make REST API calls to paths beginning with: /v1/invoices/search
 */
class V1InvoicesSearchService {
  static class GetInvoicesSearchParams {
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
     * A cursor for pagination across multiple pages of results. Don't include this parameter on the
     * first call. Use the next_page value returned in a previous response to request subsequent
     * results.
     */
    Nullable!(Nullable!(string)) page;

    /**
     * The search query string. See [search query
     * language](https://stripe.com/docs/search#search-query-language) and the list of supported
     * [query fields for invoices](https://stripe.com/docs/search#query-fields-for-invoices).
     */
    Nullable!(Nullable!(string)) query;

  }

  static class GetInvoicesSearchResponseHandler : ResponseHandler {

    static class SearchResult {
      @optional
      Nullable!(string) next_page;

      /**
       * The total number of objects that match the query, only accurate up to 10,000.
       */
      @optional
      Nullable!(int) total_count;

      @optional
      Nullable!(bool) has_more;

      /**
       * String representing the object's type. Objects of the same type share the same value.
       */
      @optional
      Nullable!(string) object;

      @optional
      Invoice[] data;

      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(SearchResult response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SearchResult)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Search for invoices you’ve previously created using Stripe’s <a
   * href="/docs/search#search-query-language">Search Query Language</a>.
   * Don’t use search in read-after-write flows where strict consistency is necessary. Under
   * normal operating
   * conditions, data is searchable in less than a minute. Occasionally, propagation of new or
   * updated data can be up
   * to an hour behind during outages. Search functionality is not available to merchants in
   * India.</p>
   * See_Also: HTTP GET `/v1/invoices/search`
   */
  void getInvoicesSearch(
      GetInvoicesSearchParams params,
      GetInvoicesSearchResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/search");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.page.isNull)
      requestor.setQueryParam("page", params.page.get.to!string);
    if (!params.query.isNull)
      requestor.setQueryParam("query", params.query.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
