// File automatically generated from OpenAPI spec.
module stripe.model.source_type_klarna;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeKlarna {
  @optional
  string pay_now_asset_urls_descriptive;

  @optional
  string page_title;

  @optional
  string last_name;

  @optional
  string purchase_country;

  @optional
  string pay_over_time_name;

  @optional
  string redirect_url;

  @optional
  string payment_method_categories;

  @optional
  string first_name;

  @optional
  string shipping_last_name;

  @optional
  string pay_later_asset_urls_descriptive;

  @optional
  string pay_later_name;

  @optional
  string purchase_type;

  @optional
  string pay_now_redirect_url;

  @optional
  string pay_over_time_redirect_url;

  @optional
  string locale;

  @optional
  string background_image_url;

  @optional
  string shipping_first_name;

  @optional
  string pay_over_time_asset_urls_descriptive;

  @optional
  string pay_later_asset_urls_standard;

  @optional
  string pay_over_time_asset_urls_standard;

  @optional
  string pay_now_name;

  @optional
  string client_token;

  @optional
  Nullable!(int) shipping_delay;

  @optional
  string pay_later_redirect_url;

  @optional
  string logo_url;

  @optional
  string pay_now_asset_urls_standard;

  mixin AddBuilder!(typeof(this));

}
