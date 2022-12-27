// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction_paper_check_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTransactionPaperCheckData {
  /**
   * Time at which the deposited funds will be available for use. Measured in seconds since the
   * Unix epoch.
   */
  @optional
  Nullable!(string) available_at;

  /**
   * Comma-separated list of invoice IDs associated with the paper check.
   */
  @optional
  Nullable!(string) invoices;

}
