// File automatically generated from OpenAPI spec.
module stripe.model.bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;

/**
 * These bank accounts are payment methods on `Customer` objects.
 * On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are
 * transfer
 * destinations on `Account` objects for [Custom
 * accounts](https://stripe.com/docs/connect/custom-accounts).
 * They can be bank accounts or debit cards as well, and are documented in the links above.
 * Related guide: [Bank Debits and
 * Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
 */
class BankAccount {
  /**
   * Two-letter ISO code representing the country the bank account is located in.
   */
  @optional
  Nullable!(string) country;

  /**
   * The routing transit number for the bank account.
   */
  @optional
  Nullable!(string) routing_number;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The ID of the customer that the bank account is associated with.
   */
  @optional
  Json customer;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the
   * bank account.
   */
  @optional
  Nullable!(string) currency;

  /**
   * Whether this bank account is the default external account for its currency.
   */
  @optional
  Nullable!(bool) default_for_currency;

  /**
   * The last four digits of the bank account number.
   */
  @optional
  Nullable!(string) last4;

  /**
   * The name of the person or business that owns the bank account.
   */
  @optional
  Nullable!(string) account_holder_name;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * A set of available payout methods for this bank account. Only values from this set should be
   * passed as the `method` when creating a payout.
   */
  @optional
  Nullable!(string)[] available_payout_methods;

  /**
   * The type of entity that holds the account. This can be either `individual` or `company`.
   */
  @optional
  Nullable!(string) account_holder_type;

  /**
   * Name of the bank associated with the routing number (e.g., `WELLS FARGO`).
   */
  @optional
  Nullable!(string) bank_name;

  /**
   * The ID of the account that the bank account is associated with.
   */
  @optional
  Json account;

  /**
   * The bank account type. This can only be `checking` or `savings` in most countries. In Japan,
   * this can only be `futsu` or `toza`.
   */
  @optional
  Nullable!(string) account_type;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  Nullable!(string) fingerprint;

  /**
   * For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`,
   * or `errored`. A bank account that hasn't had any activity or validation performed is `new`.
   * If Stripe can determine that the bank account exists, its status will be `validated`. Note
   * that there often isn’t enough information to know (e.g., for smaller credit unions), and
   * the validation is not always run. If customer bank account verification has succeeded, the
   * bank account status will be `verified`. If the verification failed for any reason, such as
   * microdeposit failure, the status will be `verification_failed`. If a transfer sent to this
   * bank account fails, we'll set the status to `errored` and will not continue to send transfers
   * until the bank details are updated.
   * For external accounts, possible values are `new` and `errored`. Validations aren't run
   * against external accounts because they're only used for payouts. This means the other
   * statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are
   * stopped until account details are updated.
   */
  @optional
  Nullable!(string) status;

}