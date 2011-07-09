RailsApplicationAssets
======================

The RailsApplicationAssets is a Rails plugin (for Rails >= 3 only, sorry).

The plugin purpose is to make the rails asset tag helpers (image_tag,
javascript_include_tag etc.) aware for a shared environment. It was
done for a web site with running multiple rails apps underneath.

# The Idea

1.  On out web server we have directories for shraed assets below the
root directory (/images, /javascrips etc.)

2. Every rails app is running under an own relative url root path (for
example /shop)

3. Every rails app is allowed to have own, non shared assets below its
relative url root path (/shop/javascripts, /shop/images, etc.)


# What the plugin does

The plugin modify the computation of the public path for the assets
used by the rails asset helpers (image_tag, javascript_include_tag,
image_path etc.)

The standard behaviour of the rails asset helpers are, if you call for
example the image_tag hepler this way:

    image_tag 'shop/teaser.png'

it creates the following html tag for you:

    <img alt="teaser" src="/images/shop/teaser.png">

if you using this plugin and your Rails app is named "shop" it swaps
the image and shop path elements:

    <img alt="teaser" src="/shop/images/teaser.png">

Other image pathes leave it unmodified:

    image_tag 'logo.png'

results to

    <img alt="teaser" src="/images/logo.png">

as without this plugin.


# How to use the plugin

To use the plugin you hav to do the following:

Add `gem 'rails_application_assets'` to your Gemfile.

Run `bundle install`

Leave all your shared assets into the subdirectories in the root
directory (/images, /javascrips etc.) of your web server.

Create a directory public/shop (or whatever your rails app is named)
in your Rails app. Create subdirectories for your assets
(public/shop/javascrips, public/shop/images and so on).

Move all your non-shared, rails-app-only assets under this directories.

Prefix the path argument of your asset helpers for your non-shared,
rails-app-only assets whit /shop.

You are done :-)


Copyright (c) 2011 Peter Ehrenberg, released under the MIT license
