class SuggestQuestion < ApplicationRecord
  has_many :suggest_answers, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :category, presence: true
  validates :content, presence: true, length: {minimum: 10}
  validates :type, presence: true

  scope :recent, ->{order created_at: :desc}
end
