// File automatically generated from OpenAPI spec.
module stripe.model.source_type_ach_credit_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAchCreditTransfer {
  @optional
  string routing_number;

  @optional
  string account_number;

  @optional
  string swift_code;

  @optional
  string refund_account_holder_name;

  @optional
  string refund_account_holder_type;

  @optional
  string refund_routing_number;

  @optional
  string bank_name;

  @optional
  string fingerprint;

}
