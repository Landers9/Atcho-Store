require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shop
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false

    config.time_zone = 'West Central Africa'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :fr
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.assets.precompile += %w( bootstrap.bundle.js )
    config.assets.precompile += %w( bootstrap.bundle.min.js )
    config.assets.precompile += %w( bootstrap.js )
    config.assets.precompile += %w( bootstrap.min.js )
    config.assets.precompile += %w( form-validate.js )
    config.assets.precompile += %w( jquery-1.11.3.min.js )
    config.assets.precompile += %w( jquery.countdown.js )
    config.assets.precompile += %w( jquery.isotope-3.0.6.min.js )
    config.assets.precompile += %w( jquery.magnific-popup.min.js )
    config.assets.precompile += %w( jquery.meanmenu.min.js )
    config.assets.precompile += %w( main.js )
    config.assets.precompile += %w( monScript.js )
    config.assets.precompile += %w( owl.carousel.min.js )
    config.assets.precompile += %w( sticker.js )
    config.assets.precompile += %w( waypoints.js )
    config.assets.precompile += %w( sweetalert.min.js )
    config.assets.precompile += %w( all.min.css )
    config.assets.precompile += %w( animate.css )
    config.assets.precompile += %w( bootstrap-grid.css )
    config.assets.precompile += %w( bootstrap-grid.min.css )
    config.assets.precompile += %w( bootstrap-reboot.css )
    config.assets.precompile += %w( bootstrap-reboot.min.css )
    config.assets.precompile += %w( bootstrap.css )
    config.assets.precompile += %w( bootstrap.min.css )
    config.assets.precompile += %w( magnific-popup.css )
    config.assets.precompile += %w( main.css )
    config.assets.precompile += %w( meanmenu.min.css )
    config.assets.precompile += %w( owl.carousel.css )
    config.assets.precompile += %w( responsive.css )
    config.assets.precompile += %w( monStyle.css )


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
  end
end
