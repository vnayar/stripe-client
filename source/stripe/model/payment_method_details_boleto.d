// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_boleto;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsBoleto {
  /**
   * The tax ID of the customer (CPF for individuals consumers or CNPJ for businesses consumers)
   */
  @optional
  string tax_id;

  mixin AddBuilder!(typeof(this));

}
