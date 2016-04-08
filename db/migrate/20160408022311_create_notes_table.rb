class CreateNotesTable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.integer :user_id
      t.integer :lecture_id
    end
  end
end
