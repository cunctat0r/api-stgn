class Measurement < ApplicationRecord
  belongs_to :post

  validates_presence_of :Upit
end
