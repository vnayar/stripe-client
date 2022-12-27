// File automatically generated from OpenAPI spec.
module stripe.model.credit_note;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.credit_note_line_item : CreditNoteLineItem;
import stripe.model.credit_note_tax_amount : CreditNoteTaxAmount;
import stripe.model.customer : Customer;
import stripe.model.customer_balance_transaction : CustomerBalanceTransaction;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.discounts_resource_discount_amount : DiscountsResourceDiscountAmount;
import stripe.model.invoice : Invoice;
import stripe.model.refund : Refund;

/**
 * Issue a credit note to adjust an invoice's amount after the invoice is finalized.
 * Related guide: [Credit Notes](https://stripe.com/docs/billing/invoices/credit-notes).
 */
class CreditNote {
  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The aggregate amounts calculated per discount for all line items.
   */
  @optional
  DiscountsResourceDiscountAmount[] discount_amounts;

  /**
   * Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or
   * `product_unsatisfactory`
   */
  @optional
  Nullable!(string) reason;

  /**
   * The integer amount in %s representing the amount of the credit note, excluding exclusive tax
   * and invoice level discounts.
   */
  @optional
  Nullable!(int) subtotal;

  /**
   * Refund related to this credit note.
   */
  @optional
  Json refund;

  /**
   * The link to download the PDF of the credit note.
   */
  @optional
  Nullable!(string) pdf;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * ID of the invoice.
   */
  @optional
  Json invoice;

  /**
   * A unique number that identifies this particular credit note and appears on the PDF of the
   * credit note and its associated invoice.
   */
  @optional
  Nullable!(string) number;

  /**
   * Amount that was credited outside of Stripe.
   */
  @optional
  Nullable!(int) out_of_band_amount;

  static class CreditNoteLinesList {
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
    Nullable!(string) object;

    /**
     * Details about each object.
     */
    @optional
    CreditNoteLineItem[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * Line items that make up the credit note
   */
  @optional
  CreditNoteLinesList lines;

  /**
   * ID of the customer.
   */
  @optional
  Json customer;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * The time that the credit note was voided.
   */
  @optional
  Nullable!(long) voided_at;

  /**
   * Customer balance transaction related to this credit note.
   */
  @optional
  Json customer_balance_transaction;

  /**
   * The integer amount in %s representing the total amount of the credit note, including tax.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * The integer amount in %s representing the amount of the credit note, excluding all tax and
   * invoice level discounts.
   */
  @optional
  Nullable!(int) subtotal_excluding_tax;

  /**
   * The integer amount in %s representing the total amount of the credit note, excluding tax, but
   * including discounts.
   */
  @optional
  Nullable!(int) total_excluding_tax;

  /**
   * Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note
   * means it was issued when the invoice was open. A `post_payment` credit note means it was
   * issued when the invoice was paid.
   */
  @optional
  Nullable!(string) type;

  /**
   * Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit
   * notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).
   */
  @optional
  Nullable!(string) status;

  /**
   * The integer amount in %s representing the total amount of the credit note, including tax and
   * all discount.
   */
  @optional
  Nullable!(int) total;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The aggregate amounts calculated per tax rate for all line items.
   */
  @optional
  CreditNoteTaxAmount[] tax_amounts;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The integer amount in %s representing the total amount of discount that was credited.
   */
  @optional
  Nullable!(int) discount_amount;

  /**
   * Customer-facing text that appears on the credit note PDF.
   */
  @optional
  Nullable!(string) memo;

}
