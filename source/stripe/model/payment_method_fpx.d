// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_fpx;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodFpx {
  /**
   * The customer's bank, if provided. Can be one of `affin_bank`, `agrobank`, `alliance_bank`,
   * `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`,
   * `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`,
   * `deutsche_bank`, `maybank2e`, `pb_enterprise`, or `bank_of_china`.
   */
  @optional
  Nullable!(string) bank;

}
