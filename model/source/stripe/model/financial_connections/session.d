// File automatically generated from OpenAPI spec.
module stripe.model.financial_connections.session;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.bank_connections_resource_accountholder : BankConnectionsResourceAccountholder;
import stripe.model.bank_connections_resource_link_account_session_filters : BankConnectionsResourceLinkAccountSessionFilters;
import stripe.model.financial_connections.account : FinancialConnectionsAccount;

/**
 * A Financial Connections Session is the secure way to programmatically launch the client-side
 * Stripe.js modal that lets your users link their accounts.
 */
class FinancialConnectionsSession {
  @optional
  BankConnectionsResourceLinkAccountSessionFilters filters;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * For webview integrations only. Upon completing OAuth login in the native browser, the user
   * will be redirected to this URL to return to your app.
   */
  @optional
  string return_url;

  /**
   * A value that will be passed to the client to launch the authentication flow.
   */
  @optional
  string client_secret;

  /**
   * The account holder for whom accounts are collected in this session.
   */
  @optional
  BankConnectionsResourceAccountholder account_holder;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  static class BankConnectionsResourceLinkedAccountList {
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
    FinancialConnectionsAccount[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

    mixin AddBuilder!(typeof(this));

  }

  /**
   * The accounts that were collected as part of this Session.
   */
  @optional
  BankConnectionsResourceLinkedAccountList accounts;

  /**
   * Permissions requested for accounts collected during this session.
   */
  @optional
  string[] permissions;

  mixin AddBuilder!(typeof(this));

}
