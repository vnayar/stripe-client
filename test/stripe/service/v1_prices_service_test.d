module stripe.service.v1_prices_service_test;

import vibe.core.log : setLogLevel, LogLevel;

import std.typecons : nullable;

import stripe.servers : Servers;
import stripe.security : Security;
import stripe.service.v1_prices_service : V1PricesService, Error_;

static this() {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
  Security.configureBasicAuth("sk_test_...Nqvri", "");
}

// Standard way to call service, declaring parameters and handlers before invoking the service.
unittest {
  auto service = new V1PricesService();
  auto params = new V1PricesService.GetPricesParams();
  params.lookup_keys = ["ham-sandwich"];
  bool success = false;
  auto handler = new V1PricesService.GetPricesResponseHandler();
  handler.handleResponse200 = (V1PricesService.GetPricesResponseHandler.PriceList priceList) {
    assert(priceList.data[0].object == "price");
    assert(priceList.data[0].unit_amount == 2000);
    assert(priceList.data[0].recurring.interval_count == 1);
    success = true;
  };
  handler.handleResponseDefault = (Error_ error) {
    assert(false);
  };
  service.getPrices(params, handler);
  assert(success);
}

// Using builders in order to invoke the service first, and then set up the parameters and handlers.
unittest {
  auto success = false;
  auto service = new V1PricesService();
  service.getPrices(
      V1PricesService.GetPricesParams.builder()
          .lookup_keys(["ham-sandwich"])
          .build(),
      V1PricesService.GetPricesResponseHandler.builder()
          .handleResponse200((V1PricesService.GetPricesResponseHandler.PriceList priceList) {
            assert(priceList.data[0].object == "price");
            assert(priceList.data[0].unit_amount == 2000);
            assert(priceList.data[0].recurring.interval_count == 1);
            success = true;
          })
          .handleResponseDefault((Error_ error) {
            assert(false);
          })
          .build());
  assert(success);
}
