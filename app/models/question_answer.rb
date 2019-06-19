class QuestionAnswer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo_one
  has_one_attached :photo_two
  has_one_attached :photo_three
  validates :answer_one, :answer_two, :answer_three, :answer_four, :answer_five, :answer_six, :question_one, :question_two, :question_three, :question_four, :question_five, :question_six, :photo_one, :photo_two, :photo_three, presence: true
end
