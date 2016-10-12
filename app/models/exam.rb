class Exam < ApplicationRecord
  has_many :question_exams, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :category, presence: true
  validates :user, presence: true
  validates :test_time, presence: true

  scope :recent, ->{order created_at: :desc}
end
