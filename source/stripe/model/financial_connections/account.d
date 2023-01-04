// File automatically generated from OpenAPI spec.
module stripe.model.financial_connections.account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.bank_connections_resource_accountholder : BankConnectionsResourceAccountholder;
import stripe.model.bank_connections_resource_balance : BankConnectionsResourceBalance;
import stripe.model.bank_connections_resource_balance_refresh : BankConnectionsResourceBalanceRefresh;
import stripe.model.bank_connections_resource_ownership_refresh : BankConnectionsResourceOwnershipRefresh;
import stripe.model.financial_connections.account_ownership : FinancialConnectionsAccountOwnership;

/**
 * A Financial Connections Account represents an account that exists outside of Stripe, to which
 * you have been granted some degree of access.
 */
class FinancialConnectionsAccount {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The name of the institution that holds this account.
   */
  @optional
  string institution_name;

  /**
   * The account holder that this account belongs to.
   */
  @optional
  BankConnectionsResourceAccountholder account_holder;

  /**
   * If `category` is `cash`, one of:
   *  - `checking`
   *  - `savings`
   *  - `other`
   * If `category` is `credit`, one of:
   *  - `mortgage`
   *  - `line_of_credit`
   *  - `credit_card`
   *  - `other`
   * If `category` is `investment` or `other`, this will be `other`.
   */
  @optional
  string subcategory;

  /**
   * The most recent information about the account's balance.
   */
  @optional
  BankConnectionsResourceBalance balance;

  /**
   * The last 4 digits of the account number. If present, this will be 4 numeric characters.
   */
  @optional
  string last4;

  /**
   * The state of the most recent attempt to refresh the account balance.
   */
  @optional
  BankConnectionsResourceBalanceRefresh balance_refresh;

  /**
   * A human-readable name that has been assigned to this account, either by the account holder or
   * by the institution.
   */
  @optional
  string display_name;

  /**
   * The type of the account. Account category is further divided in `subcategory`.
   */
  @optional
  string category;

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

  /**
   * The [PaymentMethod
   * type](https://stripe.com/docs/api/payment_methods/object#payment_method_object-type)(s) that
   * can be created from this account.
   */
  @optional
  string[] supported_payment_method_types;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The most recent information about the account's owners.
   */
  @optional
  Json ownership;

  /**
   * The list of permissions granted by this account.
   */
  @optional
  string[] permissions;

  /**
   * The state of the most recent attempt to refresh the account owners.
   */
  @optional
  BankConnectionsResourceOwnershipRefresh ownership_refresh;

  /**
   * The status of the link to the account.
   */
  @optional
  string status;

}
