require_relative 'boot'

require 'rails/all'

require "google/cloud/translate"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shelter
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.action_view.embed_authenticity_token_in_remote_forms = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
      config.active_job.queue_adapter = :sidekiq

      config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end if File.exists?(env_file)
      end

      # Your Google Cloud Platform project ID
      project_id = ENV["CLOUD_PROJECT_ID"]

      # Instantiates a client
      translate = Google::Cloud::Translate.new project: project_id

      # The text to translate
      text = "Hello, world!"
      # The target language
      target = "ja"

      # Translates some text into Russian
      translation = translate.translate text, to: target

      puts "Text: #{text}"
      puts "Translation: #{translation}"
  end
end

