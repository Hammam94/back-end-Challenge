class Trip < ApplicationRecord
  belongs_to :user

  scope :created_within, ->(from, to) {
    where("created_at BETWEEN ? AND ?", from, to)
  }
end
