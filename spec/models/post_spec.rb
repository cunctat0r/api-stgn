require 'rails_helper'

RSpec.describe Post, type: :model do
  it {should have_many(:measurements).dependent(:destroy)}
  
  it {should validate_presence_of(:main_phone_number)}
  it {should validate_presence_of(:line_name)}
  it {should validate_presence_of(:num_tower)}

end
