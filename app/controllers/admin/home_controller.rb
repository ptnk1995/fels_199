class Admin::HomeController < ApplicationController
  layout "admin"
  protect_from_forgery with: :exception

  def index
  end
end
