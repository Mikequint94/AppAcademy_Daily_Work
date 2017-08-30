# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, presence: true

  has_many :post_subs,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :PostSub,
  inverse_of: :post, dependent: :destroy

  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  has_many :comments,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Comment
end
