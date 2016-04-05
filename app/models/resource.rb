class Resource < ActiveRecord::Base

  belongs_to :users
  has_many :comments, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true
  
end
