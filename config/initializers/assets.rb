# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
 Rails.application.config.assets.precompile += %w( fonts/*.ttf )
 Rails.application.config.assets.precompile += 
%w( #{Rails.root}/vendor/assets/stylesheets/active_admin.css.scss)
Rails.application.config.assets.precompile += 
%w( #{Rails.root}/vendor/assets/javascripts/active_admin.js.coffee)
Rails.application.config.assets.precompile += %w( matches.js )
Rails.application.config.assets.precompile += %w( visitors.js )
Rails.application.config.assets.precompile += %w( teams.js )
Rails.application.config.assets.precompile += %w( posts.js )
Rails.application.config.assets.precompile += %w( team_votes.js )
#Rails.application.config.assets.precompile += %w( active_admin/active_admin_globalize.css )
