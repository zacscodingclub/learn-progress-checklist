class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :tag_name
      t.integer :lecture_id
    end
  end
end
