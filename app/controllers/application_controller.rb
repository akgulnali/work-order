class ApplicationController < ActionController::Base
  # Authentication is skipped for the JSON requests.
  protect_from_forgery unless: -> { request.format.json? }
end
