// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_ubo_declaration;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class LegalEntityUboDeclaration {
  /**
   * The IP address from which the beneficial owner attestation was made.
   */
  @optional
  string ip;

  /**
   * The Unix timestamp marking when the beneficial owner attestation was made.
   */
  @optional
  Nullable!(long) date;

  /**
   * The user-agent string from the browser where the beneficial owner attestation was made.
   */
  @optional
  string user_agent;

  mixin AddBuilder!(typeof(this));

}
