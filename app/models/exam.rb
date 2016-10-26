class Exam < ApplicationRecord
  has_many :question_exams, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :category, presence: true
  validates :user, presence: true
  validates :test_time, presence: true

  enum status: {start: 0, testing: 1, uncheck: 2, checked: 3}
  scope :recent, ->{order created_at: :desc}
end
