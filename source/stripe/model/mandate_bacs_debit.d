// File automatically generated from OpenAPI spec.
module stripe.model.mandate_bacs_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class MandateBacsDebit {
  /**
   * The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`,
   * or `accepted`.
   */
  @optional
  Nullable!(string) network_status;

  /**
   * The unique reference identifying the mandate on the Bacs network.
   */
  @optional
  Nullable!(string) reference;

  /**
   * The URL that will contain the mandate that the customer has signed.
   */
  @optional
  Nullable!(string) url;

}
