require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhoebeBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :cn

    # before_action :set_locale
    # def set_locale
    #   I18n.locale = params[:locale] ||  I18n.default_locale
    # end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_mailer.default_url_options = { :host => "localhost:3000" }
    config.action_mailer.perform_deliveries = true
    config.action_mailer.default :charset => "utf-8"
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address => "smtp.163.com",
      :port => 25,
      :domain => "163.com",
      :authenticcation => :login,
      :user_name => "gych373027161@163.com",
      :password => "XXXXXXXXXXXXXXXXXX"
    }
  end
end
