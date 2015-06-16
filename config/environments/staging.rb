Rails.application.configure do

	config.cache_classes = false
	config.eager_load = false
	config.consider_all_requests_local       = false
	config.action_controller.perform_caching = false
	config.action_dispatch.show_exceptions = false
	config.action_controller.allow_forgery_protection = false
	config.active_support.deprecation = :stderr
	config.assets.raise_runtime_errors = true

  # URI
  SITE_URI = 'https://protected-chamber-9431.herokuapp.com'
  
  # APP NAME
  APP_NAME = 'My Golf Club'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Staging]"

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