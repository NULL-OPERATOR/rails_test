class Resource < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true
end
