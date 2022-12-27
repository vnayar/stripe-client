// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.credit_note : CreditNote;
import stripe.model.customer : Customer;
import stripe.model.invoice : Invoice;

/**
 * Each customer has a
 * [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) value,
 * which denotes a debit or credit that's automatically applied to their next invoice upon
 * finalization.
 * You may modify the value directly by using the [update customer
 * API](https://stripe.com/docs/api/customers/update),
 * or by creating a Customer Balance Transaction, which increments or decrements the customer's
 * `balance` by the specified `amount`.
 * Related guide: [Customer Balance](https://stripe.com/docs/billing/customer/balance) to learn
 * more.
 */
class CustomerBalanceTransaction {
  /**
   * The amount of the transaction. A negative value is a credit for the customer's balance, and a
   * positive value is a debit to the customer's `balance`.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The ID of the invoice (if any) related to the transaction.
   */
  @optional
  Json invoice;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The ID of the customer the transaction belongs to.
   */
  @optional
  Json customer;

  /**
   * The customer's `balance` after the transaction was applied. A negative value decreases the
   * amount due on the customer's next invoice. A positive value increases the amount due on the
   * customer's next invoice.
   */
  @optional
  Nullable!(int) ending_balance;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

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
  Nullable!(string) object;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

  /**
   * Transaction type: `adjustment`, `applied_to_invoice`, `credit_note`, `initial`,
   * `invoice_overpaid`, `invoice_too_large`, `invoice_too_small`, `unspent_receiver_credit`, or
   * `unapplied_from_invoice`. See the [Customer Balance
   * page](https://stripe.com/docs/billing/customer/balance#types) to learn more about transaction
   * types.
   */
  @optional
  Nullable!(string) type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The ID of the credit note (if any) related to the transaction.
   */
  @optional
  Json credit_note;

}
