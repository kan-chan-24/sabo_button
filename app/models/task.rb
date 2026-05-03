class Task < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 30 },
            uniqueness: true
  validates :user_identifier, presence: true
end
