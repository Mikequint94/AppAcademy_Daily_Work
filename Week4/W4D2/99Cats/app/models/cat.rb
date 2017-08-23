class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(black brown tabby ginger gray burgundy sandy white)}
  validates :sex, inclusion: { in: %w(M F Q)}
  def age
    ((Date.today) - birth_date).to_i/365
  end

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest


end
