class Bear < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :personality, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_one_attached :photo
  validates :photo, presence: true
  has_many :favourites

  include PgSearch::Model

  multisearchable against: %i[name personality description]

  pg_search_scope :search_by_name_and_description,
                  against: %i[name personality description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
