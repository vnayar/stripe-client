// File automatically generated from OpenAPI spec.
module stripe.model.bank_connections_resource_accountholder;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.customer : Customer;

/**
 */
class BankConnectionsResourceAccountholder {
  /**
   * ID of the Stripe customer this account belongs to. Present if and only if
   * `account_holder.type` is `customer`.
   */
  @optional
  Json customer;

  /**
   * Type of account holder that this account belongs to.
   */
  @optional
  string type;

  /**
   * The ID of the Stripe account this account belongs to. Should only be present if
   * `account_holder.type` is `account`.
   */
  @optional
  Json account;

}
