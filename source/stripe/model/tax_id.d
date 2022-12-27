// File automatically generated from OpenAPI spec.
module stripe.model.tax_id;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer : Customer;
import stripe.model.tax_id_verification : TaxIdVerification;

/**
 * You can add one or multiple tax IDs to a [customer](https://stripe.com/docs/api/customers).
 * A customer's tax IDs are displayed on invoices and credit notes issued for the customer.
 * Related guide: [Customer Tax Identification
 * Numbers](https://stripe.com/docs/billing/taxes/tax-ids).
 */
class TaxId {
  /**
   * Two-letter ISO code representing the country of the tax ID.
   */
  @optional
  Nullable!(string) country;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * ID of the customer.
   */
  @optional
  Json customer;

  /**
   * Tax ID verification information.
   */
  @optional
  TaxIdVerification verification;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Type of the tax ID, one of `ae_trn`, `au_abn`, `au_arn`, `bg_uic`, `br_cnpj`, `br_cpf`,
   * `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `ch_vat`, `cl_tin`,
   * `eg_tin`, `es_cif`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `hk_br`, `hu_tin`, `id_npwp`,
   * `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kr_brn`, `li_uid`,
   * `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ph_tin`, `ru_inn`, `ru_kpp`,
   * `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `th_vat`, `tr_tin`, `tw_vat`, `ua_vat`, `us_ein`, or
   * `za_vat`. Note that some legacy tax IDs have type `unknown`
   */
  @optional
  Nullable!(string) type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Value of the tax ID.
   */
  @optional
  Nullable!(string) value;

}
