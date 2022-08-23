class ApplicationController < ActionController::Base
  # Before
  before_action :authenticate_user!
end
