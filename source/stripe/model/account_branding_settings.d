// File automatically generated from OpenAPI spec.
module stripe.model.account_branding_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class AccountBrandingSettings {
  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account.
   * Must be square and at least 128px x 128px.
   */
  @optional
  Json icon;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account
   * that will be used in Checkout instead of the icon and without the account's name next to it
   * if provided. Must be at least 128px x 128px.
   */
  @optional
  Json logo;

  /**
   * A CSS hex color value representing the primary branding color for this account
   */
  @optional
  string primary_color;

  /**
   * A CSS hex color value representing the secondary branding color for this account
   */
  @optional
  string secondary_color;

}
