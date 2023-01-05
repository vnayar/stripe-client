// File automatically generated from OpenAPI spec.
module stripe.model.source_type_multibanco;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeMultibanco {
  @optional
  string refund_account_holder_address_city;

  @optional
  string entity;

  @optional
  string refund_iban;

  @optional
  string refund_account_holder_address_line2;

  @optional
  string refund_account_holder_name;

  @optional
  string reference;

  @optional
  string refund_account_holder_address_postal_code;

  @optional
  string refund_account_holder_address_country;

  @optional
  string refund_account_holder_address_line1;

  @optional
  string refund_account_holder_address_state;

  mixin AddBuilder!(typeof(this));

}
