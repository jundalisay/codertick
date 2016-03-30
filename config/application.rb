require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CsTemplate
  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

    config.action_dispatch.show_exceptions = true

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: "codertick.herokuapp.com",
      user_name: 'narahelpdesk',
      password: 'nara1234',
      authentication: "plain",
      enable_starttls_auto: true
    }
  end
end
