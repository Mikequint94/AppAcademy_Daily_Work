# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord

  validates :short_url, uniqueness: true, presence: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  def self.random_code
    unique = false
    until unique
      code = SecureRandom.urlsafe_base64
      unique = true unless ShortenedUrl.exists?(:short_url => code)
    end
    return code
  end

  def self.shorten_url(user_id, long_url)
    short_url = self.random_code
    ShortenedUrl.create!(:user_id => user_id, :long_url => long_url, :short_url => short_url)
  end

  def num_clicks
    #count num clicks on a shortened url
    self.visits.count

  end

  def num_uniques
    #determine number of distinct users who have clicked a link
    self.visitors.count

  end

  def num_recent_uniques
    #collect unique clicks in recent time period

    self.visits.select(:user_id).where({created_at: (Time.now-10.minutes)..Time.now }).distinct.count

  end

  belongs_to(
    :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: :Visit,
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  has_many :visitors, Proc.new { distinct }, through: :visits, source: :user
end
