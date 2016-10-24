class AdminController < ApplicationController
  before_action :verify_admin
  layout "admin"
end
