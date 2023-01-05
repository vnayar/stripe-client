// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_company_verification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.legal_entity_company_verification_document : LegalEntityCompanyVerificationDocument;

/**
 */
class LegalEntityCompanyVerification {
  @optional
  LegalEntityCompanyVerificationDocument document;

  mixin AddBuilder!(typeof(this));

}
