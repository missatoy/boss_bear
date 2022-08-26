class Booking < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user, dependent: :destroy
  belongs_to :bear
  validates :date_start, presence: true
  validates :date_finish, presence: true
end
