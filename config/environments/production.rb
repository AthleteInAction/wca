Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  
  # URI
  SITE_URI = 'https://protected-chamber-9431.herokuapp.com'
  
  # APP NAME
  APP_NAME = 'My Golf Club'

  # PAGE TITLE
  TITLE = "#{APP_NAME}"

  # ENV
  E = Rails.env

  # ACCESS
  ACCESS = ['end-user','admin']

  # TEE's
  TEE = ['black','blue','gold','white','yellow','red']

  Instagram.configure do |config|

    config.client_id = 'aa32ba2129914b28b9e27c34804cf288'

    config.client_secret = '5a836017b44a4e85b0bf2b309562c455'

  end

end