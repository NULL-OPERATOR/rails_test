require 'spec_helper'

describe Resource, type: :model do
  it { is_expected.to have_many :comments }
end
