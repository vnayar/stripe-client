// File automatically generated from OpenAPI spec.
module stripe.service.v1_products_search_service;

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
public import stripe.model.product : Product;

/**
 * Service to make REST API calls to paths beginning with: /v1/products/search
 */
class V1ProductsSearchService {
  static class GetProductsSearchParams {
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
     * A cursor for pagination across multiple pages of results. Don't include this parameter on the
     * first call. Use the next_page value returned in a previous response to request subsequent
     * results.
     */
    string page;

    /**
     * The search query string. See [search query
     * language](https://stripe.com/docs/search#search-query-language) and the list of supported
     * [query fields for products](https://stripe.com/docs/search#query-fields-for-products).
     */
    string query;

    mixin AddBuilder!(typeof(this));

  }

  static class GetProductsSearchResponseHandler : ResponseHandler {

    static class SearchResult {
      @optional
      string next_page;

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
      string object;

      @optional
      Product[] data;

      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(SearchResult response) handleResponse200;

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
        handleResponse200(deserializeJson!(SearchResult)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Search for products you???ve previously created using Stripe???s <a
   * href="/docs/search#search-query-language">Search Query Language</a>.
   * Don???t use search in read-after-write flows where strict consistency is necessary. Under
   * normal operating
   * conditions, data is searchable in less than a minute. Occasionally, propagation of new or
   * updated data can be up
   * to an hour behind during outages. Search functionality is not available to merchants in
   * India.</p>
   * See_Also: HTTP GET `/v1/products/search`
   */
  void getProductsSearch(
      GetProductsSearchParams params,
      GetProductsSearchResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/products/search");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.page.isNull)
      requestor.setQueryParam!("deepObject")("page", params.page);
    if (!params.query.isNull)
      requestor.setQueryParam!("deepObject")("query", params.query);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
