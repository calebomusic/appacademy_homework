# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  status     :string           default("PENDING"), not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, :inclusion => { in: ["PENDING", "APPROVED", "DENIED"]}
  validate :date_order, :overlapping_approved_requests

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def date_order
    order = end_date > start_date

    unless order
      self.errors['date_order'] << "End date has to be after start date!"
    end
  end

  def overlapping_requests
    # CatRentalRequest.where("#{self.start_date} < start_date AND start_date < #{self.end_date}
    # OR #{self.start_date} < end_date AND end_date < #{self.end_date}
    # OR start_date < #{self.start_date} AND #{self.start_date} < end_date").where(:cat_id => self.cat_id)
    selfs_dates = [self.start_date, self.end_date, self.start_date, self.end_date, self.start_date, self.end_date]
    arr = CatRentalRequest.where("? <= start_date AND start_date <= ? OR
    ? <= end_date AND end_date <= ? OR start_date <= ? AND ? <= end_date", *selfs_dates).where('cat_id = ?', self.cat_id)
  end

  def overlapping_approved_requests
    overlaps = overlapping_requests.where("status = ?", 'APPROVED')

    unless overlaps.empty?
      self.errors['overlapping_requests'] << "Can't make an overlapping request"
    end
  end

  def overlapping_pending_requests
    overlaps = overlapping_requests.where("status = ?", 'PENDING').where('id !=  ?', self.id)
  end

  def approve!
    CatRentalRequest.transaction do
      overlapping_pending_requests.each{|rental| rental.deny!}
      self.status = 'APPROVED'
      self.save
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save
  end
end
