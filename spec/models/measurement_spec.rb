require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it {should belong_to(:post)}

  it {should validate_presence_of(:Upit)}
end
