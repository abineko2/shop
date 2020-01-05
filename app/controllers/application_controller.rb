class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include MoneysHelper
  include SessionsHelper
end
