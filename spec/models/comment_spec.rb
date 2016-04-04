require 'rails_helper'

describe Comment, type: :model do
  it "cannot have a rating over 5" do
    comment = Comment.new(rating: 10)
    expect(comment).to have(1).error_on(:rating)
  end
end
