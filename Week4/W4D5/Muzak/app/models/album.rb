# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer
#  band_id    :integer          not null
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  GENRES = %w[pop rock jazz espanol edm secret\ crush r&b soul funk
              classical].map(&:capitalize)

  validates :title, presence: true
  validates :band_id, presence: true
  validates :genre, inclusion: { in: GENRES }

  belongs_to :band,
  class_name: :Band,
  primary_key: :id,
  foreign_key: :band_id
end
