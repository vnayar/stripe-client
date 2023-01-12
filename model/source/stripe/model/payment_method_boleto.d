// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_boleto;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodBoleto {
  /**
   * Uniquely identifies the customer tax id (CNPJ or CPF)
   */
  @optional
  string tax_id;

  mixin AddBuilder!(typeof(this));

}
