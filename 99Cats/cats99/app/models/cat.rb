# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#

class Cat < ActiveRecord::Base
  COLORS = %w[black white brown orange grey yellow red]

  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: %w(M F) }
  validates :color, inclusion: {in: COLORS}

  has_many :rentals,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    Date.today.year - self.birth_date.year
  end
end
