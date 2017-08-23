class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
#  validate :overlapping_requests

  def overlapping_requests
    requests = cat.rental_requests
    #requests.includes(:)
    requests = requests.where({ start_date: start_date..end_date})
      .or(requests.where({ end_date: start_date..end_date}))
      .where('id != ?', id)
  end

  def overlapping_approved_requests
    overlapping_requests.select {|request| request.status == 'APPROVED'}
  end



  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy


end
