class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :text, null: false
      t.integer :grade_id, null: false
      t.integer :subject_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
