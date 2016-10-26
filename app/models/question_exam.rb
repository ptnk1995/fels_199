class QuestionExam < ApplicationRecord
  has_many :answer_chooses, dependent: :destroy

  belongs_to :question
  belongs_to :exam

  validates :exam, presence: true
  validates :question, presence: true
end
