module stripe.service.v1_checkout_sessions_service_test;

import vibe.core.log : setLogLevel, LogLevel;

import std.algorithm : startsWith;

import stripe.servers : Servers;
import stripe.service.v1_checkout_sessions_service
    : V1CheckoutSessionsService, CheckoutSession, Error_;

unittest {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
}

unittest {
  auto checkoutService = new V1CheckoutSessionsService();
  auto checkoutBody = new V1CheckoutSessionsService.PostCheckoutSessionsBody();
  auto lineItemParams = new V1CheckoutSessionsService.PostCheckoutSessionsBody.LineItemParams();
  lineItemParams.price = "ham-sandwiches";
  lineItemParams.quantity = 1;
  checkoutBody.line_items ~= lineItemParams;
  checkoutBody.mode = "subscription";
  checkoutBody.success_url = "https://localhost:8082/web/checkout/success?session_id={CHECKOUT_SESSION_ID}";
  checkoutBody.cancel_url = "https://localhost:8082/web/checkout/cancel";
  auto checkoutHandler = new V1CheckoutSessionsService.PostCheckoutSessionsResponseHandler();
  bool success = false;
  checkoutHandler.handleResponse200 = (CheckoutSession checkoutSession) {
    // import std.stdio;
    // import vibe.data.json : serializeToJson;
    // writeln("checkoutSession = ", serializeToJson(checkoutSession));
    assert(startsWith(checkoutSession.id.get, "cs_test_"));
    assert(checkoutSession.mode == "subscription");
    success = true;
  };
  checkoutHandler.handleResponsedefault = (Error_ error) {
    // import std.stdio;
    // import vibe.data.json : serializeToJson;
    // writeln("Got Error: ", serializeToJson(error));
    assert(false);
  };
  checkoutService.postCheckoutSessions(checkoutBody, checkoutHandler);
  assert(success);
}
