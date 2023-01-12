// File automatically generated from OpenAPI spec.
module stripe.security;

import openapi_client.apirequest : ApiRequest;
import openapi;

import std.base64 : Base64;
import std.conv : to;
import std.array : Appender;

class Security {

  /**
   * The currently active security method to be applied to requests.
   */
  static void delegate(ApiRequest) applySecurityF = null;

  /**
   * Enable and configure the use of an OAuth2.0 Bearer token for HTTP Authentication.
   *
   * See_Also: https://datatracker.ietf.org/doc/html/rfc6750
   */
  static void configureBearerAuth(string token) {
    applySecurityF = (ApiRequest request) {
      request.setHeaderParam("Authorization", "Bearer " ~ token);
    };
  }

  /**
   * Enable and configure the use of HTTP Basic Authentication.
   *
   * See_Also: https://en.wikipedia.org/wiki/Basic_access_authentication
   */
  static void configureBasicAuth(string username, string password) {
    applySecurityF = (ApiRequest request) {
      auto buffer = new Appender!string();
      auto credentials = cast(immutable(ubyte)[])(username ~ ":" ~ password);
      Base64.encode(credentials, buffer);
      request.setHeaderParam("Authorization", "Basic " ~ buffer.data);
    };
  }

  /**
   * Apply the currently selected security method to a request.
   */
  static void apply(ApiRequest request) {
    if (applySecurityF !is null)
      applySecurityF(request);
  }

}
