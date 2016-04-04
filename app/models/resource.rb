class Resource < ActiveRecord::Base
  has_many :comments, dependent: :destroy
end
