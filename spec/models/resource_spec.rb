require 'spec_helper'

describe Resource, type: :model do

  it { is_expected.to have_many :comments }

  it "isn't a valid name of less than three characters" do
    resource = Resource.new(name: 'on')
    expect(resource).to have(1).error_on(:name)
    expect(resource).not_to be_valid
  end

end
