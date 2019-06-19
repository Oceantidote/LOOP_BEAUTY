class AddAltTextsToQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :photo_one_alt_text, :string
    add_column :question_answers, :photo_two_alt_text, :string
    add_column :question_answers, :photo_three_alt_text, :string
  end
end
