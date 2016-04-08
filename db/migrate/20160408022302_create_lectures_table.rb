class CreateLecturesTable < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :url
      t.integer :watched
      t.integer :user_id
      t.timestamps
    end
  end
end
