// File automatically generated from OpenAPI spec.
module stripe.model.portal_login_page;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalLoginPage {
  /**
   * If `true`, a shareable `url` will be generated that will take your customers to a hosted
   * login page for the customer portal.
   * If `false`, the previously generated `url`, if any, will be deactivated.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * A shareable URL to the hosted portal login page. Your customers will be able to log in with
   * their [email](https://stripe.com/docs/api/customers/object#customer_object-email) and receive
   * a link to their customer portal.
   */
  @optional
  string url;

}
