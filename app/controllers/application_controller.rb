class ApplicationController < ActionController::Base
    #attr_accessor :adress
    skip_before_action :verify_authenticity_token
    config.session_store :cookie_store
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    config.middleware.use Rack::MethodOverride
end
