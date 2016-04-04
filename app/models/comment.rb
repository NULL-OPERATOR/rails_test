class Comment < ActiveRecord::Base

    belongs_to :resource
    validates :rating, inclusion: (1..5)

end
