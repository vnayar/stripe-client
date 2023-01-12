// File automatically generated from OpenAPI spec.
module stripe.service.v1_products_service;

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

public import stripe.model.deleted_product : DeletedProduct;
public import stripe.model.error : Error_;
public import stripe.model.product : Product;

/**
 * Service to make REST API calls to paths beginning with: /v1/products
 */
class V1ProductsService {
  static class GetProductsParams {
    /**
     * Only return products that are active or inactive (e.g., pass `false` to list all inactive
     * products).
     */
    Nullable!(bool) active;

    /**
     * Only return products that were created during the given date interval.
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
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * Only return products with the given IDs. Cannot be used with
     * [starting_after](https://stripe.com/docs/api#list_products-starting_after) or
     * [ending_before](https://stripe.com/docs/api#list_products-ending_before).
     */
    string[] ids;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * Only return products that can be shipped (i.e., physical, not digital products).
     */
    Nullable!(bool) shippable;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * Only return products with the given url.
     */
    string url;

    mixin AddBuilder!(typeof(this));

  }

  static class GetProductsResponseHandler : ResponseHandler {

    static class ProductList {
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

      /**
       * Details about each object.
       */
      @optional
      Product[] data;

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
    void delegate(ProductList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ProductList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your products. The products are returned sorted by creation date, with the
   * most recently created products appearing first.</p>
   * See_Also: HTTP GET `/v1/products`
   */
  void getProducts(
      GetProductsParams params,
      GetProductsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/products");
    if (!params.active.isNull)
      requestor.setQueryParam!("deepObject")("active", params.active);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.ids.isNull)
      requestor.setQueryParam!("deepObject")("ids", params.ids);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.shippable.isNull)
      requestor.setQueryParam!("deepObject")("shippable", params.shippable);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.url.isNull)
      requestor.setQueryParam!("deepObject")("url", params.url);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostProductsBody {
    /**
     * A label that represents units of this product in Stripe and on customers’ receipts and
     * invoices. When set, this will be included in associated invoice line item descriptions.
     */
    @optional
    string unit_label;

    /**
     * A [tax code](https://stripe.com/docs/tax/tax-categories) ID.
     */
    @optional
    string tax_code;

    /**
     * An arbitrary string to be displayed on your customer's credit card or bank statement. While
     * most banks display this information consistently, some may display it incorrectly or not at
     * all.
     * This may be up to 22 characters. The statement description may not include `<`, `>`, `\`,
     * `"`, `'` characters, and will appear on your customer's statement in capital letters.
     * Non-ASCII characters are automatically stripped.
     *  It must contain at least one letter.
     */
    @optional
    string statement_descriptor;

    /**
     * An identifier will be randomly generated by Stripe. You can optionally override this ID, but
     * the ID must be unique across all products in your Stripe account.
     */
    @optional
    string id;

    static class PackageDimensionsSpecs {
      @optional
      Nullable!(float) height;

      @optional
      Nullable!(float) length;

      @optional
      Nullable!(float) width;

      @optional
      Nullable!(float) weight;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The dimensions of this product for shipping purposes.
     */
    @optional
    PackageDimensionsSpecs package_dimensions;

    static class PriceDataWithoutProduct {
      @optional
      Nullable!(int) unit_amount;

      @optional
      string currency;

      @optional
      string unit_amount_decimal;

      static class CurrencyOption {
        static class Tier {
          @optional
          string unit_amount_decimal;

          @optional
          Nullable!(int) flat_amount;

          @optional
          Json up_to;

          @optional
          Nullable!(int) unit_amount;

          @optional
          string flat_amount_decimal;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Tier[] tiers;

        @optional
        string unit_amount_decimal;

        static class CustomUnitAmount {
          @optional
          Nullable!(bool) enabled;

          @optional
          Nullable!(int) minimum;

          @optional
          Nullable!(int) preset;

          @optional
          Nullable!(int) maximum;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        CustomUnitAmount custom_unit_amount;

        @optional
        Nullable!(int) unit_amount;

        @optional
        string tax_behavior;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CurrencyOption[string] currency_options;

      static class RecurringAdhoc {
        @optional
        Nullable!(int) interval_count;

        @optional
        string interval;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RecurringAdhoc recurring;

      @optional
      string tax_behavior;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Data used to generate a new [Price](https://stripe.com/docs/api/prices) object. This Price
     * will be set as the default price for this product.
     */
    @optional
    PriceDataWithoutProduct default_price_data;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * The product's name, meant to be displayable to the customer.
     */
    @optional
    string name;

    /**
     * Whether the product is currently available for purchase. Defaults to `true`.
     */
    @optional
    Nullable!(bool) active;

    /**
     * A URL of a publicly-accessible webpage for this product.
     */
    @optional
    string url;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
     */
    @optional
    string[] images;

    /**
     * The product's description, meant to be displayable to the customer. Use this field to
     * optionally store a long form explanation of the product being sold for your own rendering
     * purposes.
     */
    @optional
    string description;

    /**
     * Whether this product is shipped (i.e., physical goods).
     */
    @optional
    Nullable!(bool) shippable;

    mixin AddBuilder!(typeof(this));

  }

  static class PostProductsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Product response) handleResponse200;

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
        handleResponse200(deserializeJson!(Product)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new product object.</p>
   * See_Also: HTTP POST `/v1/products`
   */
  void postProducts(
      PostProductsBody requestBody,
      PostProductsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/products");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetProductsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetProductsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Product response) handleResponse200;

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
        handleResponse200(deserializeJson!(Product)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing product. Supply the unique product ID from either a
   * product creation request or the product list, and Stripe will return the corresponding product
   * information.</p>
   * See_Also: HTTP GET `/v1/products/{id}`
   */
  void getProductsId(
      GetProductsIdParams params,
      GetProductsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/products/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostProductsIdParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostProductsIdBody {
    /**
     * A label that represents units of this product in Stripe and on customers’ receipts and
     * invoices. When set, this will be included in associated invoice line item descriptions. May
     * only be set if `type=service`.
     */
    @optional
    string unit_label;

    /**
     * A [tax code](https://stripe.com/docs/tax/tax-categories) ID.
     */
    @optional
    Json tax_code;

    /**
     * An arbitrary string to be displayed on your customer's credit card or bank statement. While
     * most banks display this information consistently, some may display it incorrectly or not at
     * all.
     * This may be up to 22 characters. The statement description may not include `<`, `>`, `\`,
     * `"`, `'` characters, and will appear on your customer's statement in capital letters.
     * Non-ASCII characters are automatically stripped.
     *  It must contain at least one letter. May only be set if `type=service`.
     */
    @optional
    string statement_descriptor;

    /**
     * The ID of the [Price](https://stripe.com/docs/api/prices) object that is the default price
     * for this product.
     */
    @optional
    string default_price;

    /**
     * The dimensions of this product for shipping purposes.
     */
    @optional
    Json package_dimensions;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The product's name, meant to be displayable to the customer.
     */
    @optional
    string name;

    /**
     * Whether the product is available for purchase.
     */
    @optional
    Nullable!(bool) active;

    /**
     * A URL of a publicly-accessible webpage for this product.
     */
    @optional
    Json url;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
     */
    @optional
    Json images;

    /**
     * The product's description, meant to be displayable to the customer. Use this field to
     * optionally store a long form explanation of the product being sold for your own rendering
     * purposes.
     */
    @optional
    string description;

    /**
     * Whether this product is shipped (i.e., physical goods).
     */
    @optional
    Nullable!(bool) shippable;

    mixin AddBuilder!(typeof(this));

  }

  static class PostProductsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Product response) handleResponse200;

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
        handleResponse200(deserializeJson!(Product)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specific product by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged.</p>
   * See_Also: HTTP POST `/v1/products/{id}`
   */
  void postProductsId(
      PostProductsIdParams params,
      PostProductsIdBody requestBody,
      PostProductsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/products/{id}");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteProductsIdParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteProductsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedProduct response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedProduct)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete a product. Deleting a product is only possible if it has no prices associated with
   * it. Additionally, deleting a product with <code>type=good</code> is only possible if it has no
   * SKUs associated with it.</p>
   * See_Also: HTTP DELETE `/v1/products/{id}`
   */
  void deleteProductsId(
      DeleteProductsIdParams params,
      DeleteProductsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/products/{id}");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}
