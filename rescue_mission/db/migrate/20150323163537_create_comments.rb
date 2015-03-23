class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
