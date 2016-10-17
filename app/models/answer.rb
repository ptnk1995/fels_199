class Answer < ApplicationRecord
  has_many :answer_chooses, dependent: :destroy

  belongs_to :question

  validates :question, presence: true
  validates :content, prensence: true

  scope :recent, ->{oder created_at: :desc}
end
