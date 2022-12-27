// File automatically generated from OpenAPI spec.
module stripe.model.account_payments_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AccountPaymentsSettings {
  /**
   * The Kanji variation of the default text that appears on credit card statements when a charge
   * is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kanji`
   * specified on the charge. `statement_descriptor_prefix_kanji` is useful for maximizing
   * descriptor space for the dynamic portion.
   */
  @optional
  Nullable!(string) statement_descriptor_prefix_kanji;

  /**
   * The Kana variation of the default text that appears on credit card statements when a charge
   * is made (Japan only)
   */
  @optional
  Nullable!(string) statement_descriptor_kana;

  /**
   * The default text that appears on credit card statements when a charge is made. This field
   * prefixes any dynamic `statement_descriptor` specified on the charge.
   */
  @optional
  Nullable!(string) statement_descriptor;

  /**
   * The Kana variation of the default text that appears on credit card statements when a charge
   * is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kana`
   * specified on the charge. `statement_descriptor_prefix_kana` is useful for maximizing
   * descriptor space for the dynamic portion.
   */
  @optional
  Nullable!(string) statement_descriptor_prefix_kana;

  /**
   * The Kanji variation of the default text that appears on credit card statements when a charge
   * is made (Japan only)
   */
  @optional
  Nullable!(string) statement_descriptor_kanji;

}
