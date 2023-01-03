module stripe.service.v1_prices_service_test;

import vibe.core.log : setLogLevel, LogLevel;

import stripe.servers : Servers;
import stripe.service.v1_prices_service : V1PricesService, Error_;

unittest {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
}

unittest {
  auto service = new V1PricesService();
  auto params = new V1PricesService.GetPricesParams();
  auto handler = new V1PricesService.GetPricesResponseHandler();
  bool success = false;
  handler.handleResponse200 = (V1PricesService.GetPricesResponseHandler.PriceList priceList) {
    //import vibe.data.json : serializeToJson;
    //import std.stdio;
    //writeln("Got PriceList: ", serializeToJson(priceList));
    assert(priceList.data[0].object == "price");
    assert(priceList.data[0].unit_amount == 2000);
    assert(priceList.data[0].recurring.interval_count == 1);
    success = true;
  };
  handler.handleResponsedefault = (Error_ error) {
    assert(false);
  };
  service.getPrices(params, handler);
  assert(success);
}
