class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :user_id, null: false
      t.boolean :favorite

      t.timestamps null: false
    end
    add_index(:questions, [:favorite, :id ], unique: true)
  end
end
