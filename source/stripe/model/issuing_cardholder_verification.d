// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_verification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_cardholder_id_document : IssuingCardholderIdDocument;

/**
 */
class IssuingCardholderVerification {
  /**
   * An identifying document, either a passport or local ID card.
   */
  @optional
  IssuingCardholderIdDocument document;

}
