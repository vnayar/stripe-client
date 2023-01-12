// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_id_document;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class IssuingCardholderIdDocument {
  /**
   * The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file)
   * with a `purpose` value of `identity_document`.
   */
  @optional
  Json front;

  /**
   * The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file)
   * with a `purpose` value of `identity_document`.
   */
  @optional
  Json back;

  mixin AddBuilder!(typeof(this));

}
