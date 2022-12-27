// File automatically generated from OpenAPI spec.
module stripe.model.source;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.source_code_verification_flow : SourceCodeVerificationFlow;
import stripe.model.source_order : SourceOrder;
import stripe.model.source_owner : SourceOwner;
import stripe.model.source_receiver_flow : SourceReceiverFlow;
import stripe.model.source_redirect_flow : SourceRedirectFlow;
import stripe.model.source_type_ach_credit_transfer : SourceTypeAchCreditTransfer;
import stripe.model.source_type_ach_debit : SourceTypeAchDebit;
import stripe.model.source_type_acss_debit : SourceTypeAcssDebit;
import stripe.model.source_type_alipay : SourceTypeAlipay;
import stripe.model.source_type_au_becs_debit : SourceTypeAuBecsDebit;
import stripe.model.source_type_bancontact : SourceTypeBancontact;
import stripe.model.source_type_card : SourceTypeCard;
import stripe.model.source_type_card_present : SourceTypeCardPresent;
import stripe.model.source_type_eps : SourceTypeEps;
import stripe.model.source_type_giropay : SourceTypeGiropay;
import stripe.model.source_type_ideal : SourceTypeIdeal;
import stripe.model.source_type_klarna : SourceTypeKlarna;
import stripe.model.source_type_multibanco : SourceTypeMultibanco;
import stripe.model.source_type_p24 : SourceTypeP24;
import stripe.model.source_type_sepa_debit : SourceTypeSepaDebit;
import stripe.model.source_type_sofort : SourceTypeSofort;
import stripe.model.source_type_three_d_secure : SourceTypeThreeDSecure;
import stripe.model.source_type_wechat : SourceTypeWechat;

/**
 * `Source` objects allow you to accept a variety of payment methods. They
 * represent a customer's payment instrument, and can be used with the Stripe API
 * just like a `Card` object: once chargeable, they can be charged, or can be
 * attached to customers.
 * Stripe doesn't recommend using the deprecated [Sources
 * API](https://stripe.com/docs/api/sources).
 * We recommend that you adopt the [PaymentMethods
 * API](https://stripe.com/docs/api/payment_methods).
 * This newer API provides access to our latest features and payment method types.
 * Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources &
 * Customers](https://stripe.com/docs/sources/customers).
 */
class Source {
  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  @optional
  SourceTypeGiropay giropay;

  /**
   * Information about the owner of the payment instrument that may be used or required by
   * particular source types.
   */
  @optional
  SourceOwner owner;

  @optional
  SourceTypeIdeal ideal;

  @optional
  SourceTypeCard card;

  @optional
  SourceTypeCardPresent card_present;

  @optional
  SourceTypeWechat wechat;

  @optional
  SourceTypeAchDebit ach_debit;

  @optional
  SourceTypeAcssDebit acss_debit;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  SourceTypeBancontact bancontact;

  @optional
  SourceTypeAchCreditTransfer ach_credit_transfer;

  @optional
  SourceTypeAlipay alipay;

  @optional
  SourceTypeEps eps;

  /**
   * The ID of the customer to which this source is attached. This will not be present when the
   * source has not been attached to a customer.
   */
  @optional
  Nullable!(string) customer;

  /**
   * Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with
   * the source. This is the currency for which the source will be chargeable once ready. Required
   * for `single_use` sources.
   */
  @optional
  Nullable!(string) currency;

  @optional
  SourceTypeSofort sofort;

  @optional
  SourceTypeP24 p24;

  /**
   * A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1,
   * Japanese Yen being a zero-decimal currency) representing the total amount associated with the
   * source. This is the amount for which the source will be chargeable once ready. Required for
   * `single_use` sources.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  @optional
  SourceTypeMultibanco multibanco;

  @optional
  SourceCodeVerificationFlow code_verification;

  /**
   * The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`,
   * `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`,
   * `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An
   * additional hash is included on the source with a name matching this value. It contains
   * additional information specific to the [payment method](https://stripe.com/docs/sources)
   * used.
   */
  @optional
  Nullable!(string) type;

  /**
   * The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or
   * `pending`. Only `chargeable` sources can be used to create a charge.
   */
  @optional
  Nullable!(string) status;

  @optional
  SourceTypeAuBecsDebit au_becs_debit;

  @optional
  SourceTypeKlarna klarna;

  /**
   * Extra information about a source. This will appear on your customer's statement every time
   * you charge the source.
   */
  @optional
  Nullable!(string) statement_descriptor;

  /**
   * Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source
   * types may or may not be reusable by construction, while others may leave the option at
   * creation. If an incompatible value is passed, an error will be returned.
   */
  @optional
  Nullable!(string) usage;

  /**
   * The client secret of the source. Used for client-side retrieval using a publishable key.
   */
  @optional
  Nullable!(string) client_secret;

  @optional
  SourceTypeSepaDebit sepa_debit;

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

  @optional
  SourceRedirectFlow redirect;

  @optional
  SourceOrder source_order;

  @optional
  SourceTypeThreeDSecure three_d_secure;

  /**
   * The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`,
   * `code_verification`, `none`.
   */
  @optional
  Nullable!(string) flow;

  @optional
  SourceReceiverFlow receiver;

}
