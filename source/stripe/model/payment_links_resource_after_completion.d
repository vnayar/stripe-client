// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_after_completion;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_links_resource_completion_behavior_confirmation_page : PaymentLinksResourceCompletionBehaviorConfirmationPage;
import stripe.model.payment_links_resource_completion_behavior_redirect : PaymentLinksResourceCompletionBehaviorRedirect;

/**
 */
class PaymentLinksResourceAfterCompletion {
  /**
   * The specified behavior after the purchase is complete.
   */
  @optional
  Nullable!(string) type;

  @optional
  PaymentLinksResourceCompletionBehaviorConfirmationPage hosted_confirmation;

  @optional
  PaymentLinksResourceCompletionBehaviorRedirect redirect;

}
