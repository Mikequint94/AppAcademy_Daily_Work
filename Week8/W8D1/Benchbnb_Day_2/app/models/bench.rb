class Bench < ApplicationRecord
  validates :description, :lat, :lng, null: false

end
