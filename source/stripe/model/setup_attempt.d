// File automatically generated from OpenAPI spec.
module stripe.model.setup_attempt;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.api_errors : ApiErrors;
import stripe.model.application : Application;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.payment_method : PaymentMethod;
import stripe.model.setup_attempt_payment_method_details : SetupAttemptPaymentMethodDetails;
import stripe.model.setup_intent : SetupIntent;

/**
 * A SetupAttempt describes one attempted confirmation of a SetupIntent,
 * whether that confirmation was successful or unsuccessful. You can use
 * SetupAttempts to inspect details of a specific attempt at setting up a
 * payment method using a SetupIntent.
 */
class SetupAttempt {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  @optional
  SetupAttemptPaymentMethodDetails payment_method_details;

  /**
   * The value of
   * [customer](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-customer) on
   * the SetupIntent at the time of this confirmation.
   */
  @optional
  Json customer;

  /**
   * The value of
   * [usage](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-usage) on the
   * SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.
   */
  @optional
  string usage;

  /**
   * If present, the SetupIntent's payment method will be attached to the in-context Stripe
   * Account.
   * It can only be used for this Stripe Account’s own money movement flows like InboundTransfer
   * and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a
   * Customer, and defaults to false when attaching a PaymentMethod to a Customer.
   */
  @optional
  Nullable!(bool) attach_to_self;

  /**
   * The value of
   * [application](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-applicatio
   * n) on the SetupIntent at the time of this confirmation.
   */
  @optional
  Json application;

  /**
   * ID of the payment method used with this SetupAttempt.
   */
  @optional
  Json payment_method;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Indicates the directions of money movement for which this payment method is intended to be
   * used.
   * Include `inbound` if you intend to use the payment method as the origin to pull funds from.
   * Include `outbound` if you intend to use the payment method as the destination to send funds
   * to. You can include both if you intend to use the payment method for both purposes.
   */
  @optional
  string[] flow_directions;

  /**
   * ID of the SetupIntent that this attempt belongs to.
   */
  @optional
  Json setup_intent;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The error encountered during this attempt to confirm the SetupIntent, if any.
   */
  @optional
  ApiErrors setup_error;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The value of
   * [on_behalf_of](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-on_behalf
   * _of) on the SetupIntent at the time of this confirmation.
   */
  @optional
  Json on_behalf_of;

  /**
   * Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`,
   * `succeeded`, `failed`, or `abandoned`.
   */
  @optional
  string status;

}
