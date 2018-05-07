class Post < ApplicationRecord
  has_many :measurements, dependent: :destroy

  validates_presence_of :main_phone_number, :line_name, :num_tower  
end
