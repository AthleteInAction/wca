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
  SITE_URI = 'https://obscure-meadow-8478.herokuapp.com'
  
  # APP NAME
  APP_NAME = 'WAC'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Staging]"

  # ENV
  E = Rails.env

  # ACCESS
  ACCESS = ['end-user','admin']

end