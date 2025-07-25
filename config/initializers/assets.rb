# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

Rails.application.config.assets.css_compressor = nil

Rails.application.config.assets.paths << Rails.root.join("app/assets/builds")
Rails.application.config.assets.precompile += %w( builds/application.css builds/application.js )

Rails.application.config.assets.paths << Rails.root.join("node_modules")
# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
