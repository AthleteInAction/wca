Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.assets.raise_runtime_errors = true

  config.assets.paths << Rails.root.join('app', 'assets', 'flash')

  # URI
  SITE_URI = 'http://localhost:3000'
  
  # APP NAME
  APP_NAME = 'WCA'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Local]"

  # ENV
  E = Rails.env

  # ACCESS
  ACCESS = ['end-user','admin']

  # SOUNDCLOUD
  SC = Soundcloud.new client_id: '4d0e36fdbe21f60751fa33f6c3ab37b9'

end