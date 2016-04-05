module ApplicationHelper
  def find_resource(params)
    Resource.find(params)
  end
end
