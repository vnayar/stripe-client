// File automatically generated from OpenAPI spec.
module stripe.model.issuing_card_shipping_customs;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingCardShippingCustoms {
  /**
   * A registration number used for customs in Europe. See https://www.gov.uk/eori and
   * https://ec.europa.eu/taxation_customs/business/customs-procedures-import-and-export/customs-p
   * rocedures/economic-operators-registration-and-identification-number-eori_en.
   */
  @optional
  string eori_number;

}
