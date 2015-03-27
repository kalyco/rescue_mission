class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
