class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_resource(params)
    Resource.find(params)
  end
end
