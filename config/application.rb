require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tank
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp  
    config.active_record.raise_in_transactional_callbacks = true
    config.action_mailer.smtp_settings = {
    :address        => "smtp.163.com",
    :port           => 25,
    :domain         => "www.163.com",
    :authentication => :login,
    :user_name      => "13569267770@163.com",
    :password       => "wu594271610"
    }
    end

end
