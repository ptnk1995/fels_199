class SuggestAnswer < ApplicationRecord
  belongs_to :suggest_question

  validates :content, presence: true
  validates :suggest_question, presence: true

  scope :recent, ->{oder created_at: :desc}
end
