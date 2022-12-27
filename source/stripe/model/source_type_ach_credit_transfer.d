// File automatically generated from OpenAPI spec.
module stripe.model.source_type_ach_credit_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAchCreditTransfer {
  @optional
  Nullable!(string) routing_number;

  @optional
  Nullable!(string) account_number;

  @optional
  Nullable!(string) swift_code;

  @optional
  Nullable!(string) refund_account_holder_name;

  @optional
  Nullable!(string) refund_account_holder_type;

  @optional
  Nullable!(string) refund_routing_number;

  @optional
  Nullable!(string) bank_name;

  @optional
  Nullable!(string) fingerprint;

}
