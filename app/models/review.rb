class Review < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  belongs_to :event

  # validates :rating, presence: true
  # validates :feedback, presence: true
end

