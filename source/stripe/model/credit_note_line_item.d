// File automatically generated from OpenAPI spec.
module stripe.model.credit_note_line_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.credit_note_tax_amount : CreditNoteTaxAmount;
import stripe.model.discounts_resource_discount_amount : DiscountsResourceDiscountAmount;
import stripe.model.tax_rate : TaxRate;

/**
 */
class CreditNoteLineItem {
  /**
   * The integer amount in %s representing the gross amount being credited for this line item,
   * excluding (exclusive) tax and discounts.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The cost of each unit of product being credited.
   */
  @optional
  Nullable!(int) unit_amount;

  /**
   * The integer amount in %s representing the amount being credited for this line item, excluding
   * all tax and discounts.
   */
  @optional
  Nullable!(int) amount_excluding_tax;

  /**
   * The amount of discount calculated per discount for this line item
   */
  @optional
  DiscountsResourceDiscountAmount[] discount_amounts;

  /**
   * The number of units of product being credited.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * ID of the invoice line item being credited
   */
  @optional
  Nullable!(string) invoice_line_item;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The amount of tax calculated per tax rate for this line item
   */
  @optional
  CreditNoteTaxAmount[] tax_amounts;

  /**
   * Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
   */
  @optional
  Nullable!(string) unit_amount_decimal;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The integer amount in %s representing the discount being credited for this line item.
   */
  @optional
  Nullable!(int) discount_amount;

  /**
   * Description of the item being credited.
   */
  @optional
  Nullable!(string) description;

  /**
   * The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When
   * the type is `invoice_line_item` there is an additional `invoice_line_item` property on the
   * resource the value of which is the id of the credited line item on the invoice.
   */
  @optional
  Nullable!(string) type;

  /**
   * The tax rates which apply to the line item.
   */
  @optional
  TaxRate[] tax_rates;

  /**
   * The amount in %s representing the unit amount being credited for this line item, excluding
   * all tax and discounts.
   */
  @optional
  Nullable!(string) unit_amount_excluding_tax;

}
