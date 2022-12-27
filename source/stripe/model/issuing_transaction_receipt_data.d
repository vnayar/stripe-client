// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_receipt_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionReceiptData {
  /**
   * The description of the item. The maximum length of this field is 26 characters.
   */
  @optional
  Nullable!(string) description;

  /**
   * The quantity of the item.
   */
  @optional
  Nullable!(float) quantity;

  /**
   * The total for this line item in cents.
   */
  @optional
  Nullable!(int) total;

  /**
   * The unit cost of the item in cents.
   */
  @optional
  Nullable!(int) unit_cost;

}
