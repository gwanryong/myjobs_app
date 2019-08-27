class Overtimeinfo < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :overtime, presence: true
  validates :extratime, presence: true
end