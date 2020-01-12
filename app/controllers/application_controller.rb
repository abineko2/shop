class ApplicationController < ActionController::Base
  protect_from_forgery 
  include MoneysHelper
  include SessionsHelper
end
