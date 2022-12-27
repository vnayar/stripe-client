// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_boleto;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodBoleto {
  /**
   * Uniquely identifies the customer tax id (CNPJ or CPF)
   */
  @optional
  Nullable!(string) tax_id;

}
