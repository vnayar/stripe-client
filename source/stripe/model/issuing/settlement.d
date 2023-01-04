// File automatically generated from OpenAPI spec.
module stripe.model.issuing.settlement;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * When a non-stripe BIN is used, any use of an [issued card](https://stripe.com/docs/issuing)
 * must be settled directly with the card network. The net amount owed is represented by an
 * Issuing `Settlement` object.
 */
class IssuingSettlement {
  /**
   * The date that the transactions are cleared and posted to user's accounts.
   */
  @optional
  Nullable!(int) clearing_date;

  /**
   * The total transaction amount reflected in this settlement.
   */
  @optional
  Nullable!(int) transaction_volume;

  /**
   * The total number of transactions reflected in this settlement.
   */
  @optional
  Nullable!(int) transaction_count;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The total amount of fees owed to the network.
   */
  @optional
  Nullable!(int) network_fees;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The Settlement Identification Number assigned by the network.
   */
  @optional
  string network_settlement_identifier;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The total interchange received as reimbursement for the transactions.
   */
  @optional
  Nullable!(int) interchange_fees;

  /**
   * The card network for this settlement report. One of ["visa"]
   */
  @optional
  string network;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The Bank Identification Number reflecting this settlement record.
   */
  @optional
  string bin;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The total net amount required to settle with the network.
   */
  @optional
  Nullable!(int) net_total;

  /**
   * One of `international` or `uk_national_net`.
   */
  @optional
  string settlement_service;

}
