class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  belongs_to :category

  validates :category, presence: true
  validates :content, presence: true, length: {minimum: 10}
  validates :type, presence: true

  scope :recent, ->{order created_at: :desc}
end
