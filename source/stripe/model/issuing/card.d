// File automatically generated from OpenAPI spec.
module stripe.model.issuing.card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing.cardholder : IssuingCardholder;
import stripe.model.issuing_card_authorization_controls : IssuingCardAuthorizationControls;
import stripe.model.issuing_card_shipping : IssuingCardShipping;
import stripe.model.issuing_card_wallets : IssuingCardWallets;

/**
 * You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are
 * issued to cardholders.
 */
class IssuingCard {
  /**
   * The card's CVC. For security reasons, this is only available for virtual cards, and will be
   * omitted unless you explicitly request it with [the `expand`
   * parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available
   * via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not
   * via "List all cards" or any other endpoint.
   */
  @optional
  string cvc;

  /**
   * The card this card replaces, if any.
   */
  @optional
  Json replacement_for;

  /**
   * The latest card that replaces this card, if any.
   */
  @optional
  Json replaced_by;

  /**
   * The full unredacted card number. For security reasons, this is only available for virtual
   * cards, and will be omitted unless you explicitly request it with [the `expand`
   * parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available
   * via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not
   * via "List all cards" or any other endpoint.
   */
  @optional
  string number;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  @optional
  IssuingCardAuthorizationControls spending_controls;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Supported currencies are `usd` in the US, `eur` in the EU, and `gbp` in the UK.
   */
  @optional
  string currency;

  /**
   * The expiration month of the card.
   */
  @optional
  Nullable!(int) exp_month;

  /**
   * The reason why the previous card needed to be replaced.
   */
  @optional
  string replacement_reason;

  /**
   * The expiration year of the card.
   */
  @optional
  Nullable!(int) exp_year;

  /**
   * The brand of the card.
   */
  @optional
  string brand;

  @optional
  IssuingCardholder cardholder;

  /**
   * The last 4 digits of the card number.
   */
  @optional
  string last4;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The financial account this card is attached to.
   */
  @optional
  string financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The reason why the card was canceled.
   */
  @optional
  string cancellation_reason;

  /**
   * Where and how the card will be shipped.
   */
  @optional
  IssuingCardShipping shipping;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The type of the card.
   */
  @optional
  string type;

  /**
   * Information relating to digital wallets (like Apple Pay and Google Pay).
   */
  @optional
  IssuingCardWallets wallets;

  /**
   * Whether authorizations can be approved on this card.
   */
  @optional
  string status;

}
