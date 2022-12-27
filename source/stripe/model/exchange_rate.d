// File automatically generated from OpenAPI spec.
module stripe.model.exchange_rate;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * `Exchange Rate` objects allow you to determine the rates that Stripe is
 * currently using to convert from one currency to another. Since this number is
 * variable throughout the day, there are various reasons why you might want to
 * know the current rate (for example, to dynamically price an item for a user
 * with a default payment in a foreign currency).
 * If you want a guarantee that the charge is made with a certain exchange rate
 * you expect is current, you can pass in `exchange_rate` to charges endpoints.
 * If the value is no longer up to date, the charge won't go through. Please
 * refer to our [Exchange Rates API](https://stripe.com/docs/exchange-rates) guide for more
 * details.
 */
class ExchangeRate {
  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Hash where the keys are supported currencies and the values are the exchange rate at which
   * the base id currency converts to the key currency.
   */
  @optional
  Nullable!(float)[string] rates;

  /**
   * Unique identifier for the object. Represented as the three-letter [ISO currency
   * code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase.
   */
  @optional
  Nullable!(string) id;

}
