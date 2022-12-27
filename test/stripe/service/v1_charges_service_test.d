module stripe.service.v1_charges_service_test;

import stripe.servers : Servers;
import stripe.security : Security;
import stripe.service.v1_charges_service : V1ChargesService;
import vibe.data.json : serializeToJsonString;
import vibe.core.log : setLogLevel, LogLevel;
import std.stdio;

unittest {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
}

///
unittest {
  Security.configureBasicAuth("sk_test_...Nqvri", "");
  auto service = new V1ChargesService();
  auto handler = new V1ChargesService.GetChargesResponseHandler();
  handler.handleResponse200 = (V1ChargesService.GetChargesResponseHandler.ChargeList chargeList) {
    writeln(serializeToJsonString(chargeList));
  };
  service.getCharges(new V1ChargesService.GetChargesParams(), handler);
}
