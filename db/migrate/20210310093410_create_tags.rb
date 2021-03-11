class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :grade_id, null:false
      t.integer :subject_id, null:false
      t.timestamps
    end
  end
end
