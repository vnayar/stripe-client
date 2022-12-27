// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_p24;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsP24 {
  /**
   * The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`,
   * `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`,
   * `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`,
   * `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`,
   * `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`.
   */
  @optional
  Nullable!(string) bank;

  /**
   * Unique reference for this Przelewy24 payment.
   */
  @optional
  Nullable!(string) reference;

  /**
   * Owner's verified full name. Values are verified or provided by Przelewy24 directly
   * (if supported) at the time of authorization or settlement. They cannot be set or mutated.
   * Przelewy24 rarely provides this information so the attribute is usually empty.
   */
  @optional
  Nullable!(string) verified_name;

}
