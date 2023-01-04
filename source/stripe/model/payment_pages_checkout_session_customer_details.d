// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_customer_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.payment_pages_checkout_session_tax_id : PaymentPagesCheckoutSessionTaxId;

/**
 */
class PaymentPagesCheckoutSessionCustomerDetails {
  /**
   * The email associated with the Customer, if one exists, on the Checkout Session after a
   * completed Checkout Session or at time of session expiry.
   * Otherwise, if the customer has consented to promotional content, this value is the most
   * recent valid email provided by the customer on the Checkout form.
   */
  @optional
  string email;

  /**
   * The customer's phone number after a completed Checkout Session.
   */
  @optional
  string phone;

  /**
   * The customer’s tax exempt status after a completed Checkout Session.
   */
  @optional
  string tax_exempt;

  /**
   * The customer's address after a completed Checkout Session. Note: This property is populated
   * only for sessions on or after March 30, 2022.
   */
  @optional
  Address address;

  /**
   * The customer’s tax IDs after a completed Checkout Session.
   */
  @optional
  PaymentPagesCheckoutSessionTaxId[] tax_ids;

  /**
   * The customer's name after a completed Checkout Session. Note: This property is populated only
   * for sessions on or after March 30, 2022.
   */
  @optional
  string name;

}
