// File automatically generated from OpenAPI spec.
module stripe.model.source_transaction_paper_check_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTransactionPaperCheckData {
  /**
   * Time at which the deposited funds will be available for use. Measured in seconds since the
   * Unix epoch.
   */
  @optional
  string available_at;

  /**
   * Comma-separated list of invoice IDs associated with the paper check.
   */
  @optional
  string invoices;

  mixin AddBuilder!(typeof(this));

}
