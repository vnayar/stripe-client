// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_klarna;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsKlarna {
  /**
   * The Klarna payment method used for this transaction.
   * Can be one of `pay_later`, `pay_now`, `pay_with_financing`, or `pay_in_installments`
   */
  @optional
  string payment_method_category;

  /**
   * Preferred language of the Klarna authorization page that the customer is redirected to.
   * Can be one of `de-AT`, `en-AT`, `nl-BE`, `fr-BE`, `en-BE`, `de-DE`, `en-DE`, `da-DK`,
   * `en-DK`, `es-ES`, `en-ES`, `fi-FI`, `sv-FI`, `en-FI`, `en-GB`, `en-IE`, `it-IT`, `en-IT`,
   * `nl-NL`, `en-NL`, `nb-NO`, `en-NO`, `sv-SE`, `en-SE`, `en-US`, `es-US`, `fr-FR`, `en-FR`,
   * `en-AU`, `en-NZ`, `en-CA`, `fr-CA`, `pl-PL`, `en-PL`, `pt-PT`, `en-PT`, `de-CH`, `fr-CH`,
   * `it-CH`, or `en-CH`
   */
  @optional
  string preferred_locale;

  mixin AddBuilder!(typeof(this));

}
