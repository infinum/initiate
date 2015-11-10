Bugsnag.configure do |config|
  config.api_key = Rails.application.secrets.bugsnag_api_key
  config.ignore_classes = []
  config.notify_release_stages = ['production', 'staging']
end
