// File automatically generated from OpenAPI spec.
module stripe.model.gelato_verification_session_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.gelato_session_document_options : GelatoSessionDocumentOptions;
import stripe.model.gelato_session_id_number_options : GelatoSessionIdNumberOptions;

/**
 */
class GelatoVerificationSessionOptions {
  @optional
  GelatoSessionDocumentOptions document;

  @optional
  GelatoSessionIdNumberOptions id_number;

  mixin AddBuilder!(typeof(this));

}
