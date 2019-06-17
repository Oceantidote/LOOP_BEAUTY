class AddColumnsToQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :question_one, :text
    add_column :question_answers, :question_two, :text
    add_column :question_answers, :question_three, :text
    add_column :question_answers, :question_four, :text
    add_column :question_answers, :question_five, :text
    add_column :question_answers, :question_six, :text
    add_column :question_answers, :answer_one, :text
    add_column :question_answers, :answer_two, :text
    add_column :question_answers, :answer_three, :text
    add_column :question_answers, :answer_four, :text
    add_column :question_answers, :answer_five, :text
    add_column :question_answers, :answer_six, :text
  end
end
