// File automatically generated from OpenAPI spec.
module stripe.model.linked_account_options_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class LinkedAccountOptionsUsBankAccount {
  /**
   * The list of permissions to request. The `payment_method` permission must be included.
   */
  @optional
  string[] permissions;

  /**
   * For webview integrations only. Upon completing OAuth login in the native browser, the user
   * will be redirected to this URL to return to your app.
   */
  @optional
  string return_url;

}
