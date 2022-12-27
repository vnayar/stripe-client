// File automatically generated from OpenAPI spec.
module stripe.model.source_type_klarna;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeKlarna {
  @optional
  Nullable!(string) pay_now_asset_urls_descriptive;

  @optional
  Nullable!(string) page_title;

  @optional
  Nullable!(string) last_name;

  @optional
  Nullable!(string) purchase_country;

  @optional
  Nullable!(string) pay_over_time_name;

  @optional
  Nullable!(string) redirect_url;

  @optional
  Nullable!(string) payment_method_categories;

  @optional
  Nullable!(string) first_name;

  @optional
  Nullable!(string) shipping_last_name;

  @optional
  Nullable!(string) pay_later_asset_urls_descriptive;

  @optional
  Nullable!(string) pay_later_name;

  @optional
  Nullable!(string) purchase_type;

  @optional
  Nullable!(string) pay_now_redirect_url;

  @optional
  Nullable!(string) pay_over_time_redirect_url;

  @optional
  Nullable!(string) locale;

  @optional
  Nullable!(string) background_image_url;

  @optional
  Nullable!(string) shipping_first_name;

  @optional
  Nullable!(string) pay_over_time_asset_urls_descriptive;

  @optional
  Nullable!(string) pay_later_asset_urls_standard;

  @optional
  Nullable!(string) pay_over_time_asset_urls_standard;

  @optional
  Nullable!(string) pay_now_name;

  @optional
  Nullable!(string) client_token;

  @optional
  Nullable!(int) shipping_delay;

  @optional
  Nullable!(string) pay_later_redirect_url;

  @optional
  Nullable!(string) logo_url;

  @optional
  Nullable!(string) pay_now_asset_urls_standard;

}
