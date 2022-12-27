// File automatically generated from OpenAPI spec.
module stripe.model.source_type_multibanco;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeMultibanco {
  @optional
  Nullable!(string) refund_account_holder_address_city;

  @optional
  Nullable!(string) entity;

  @optional
  Nullable!(string) refund_iban;

  @optional
  Nullable!(string) refund_account_holder_address_line2;

  @optional
  Nullable!(string) refund_account_holder_name;

  @optional
  Nullable!(string) reference;

  @optional
  Nullable!(string) refund_account_holder_address_postal_code;

  @optional
  Nullable!(string) refund_account_holder_address_country;

  @optional
  Nullable!(string) refund_account_holder_address_line1;

  @optional
  Nullable!(string) refund_account_holder_address_state;

}
