class FixLecturesTable < ActiveRecord::Migration
  def change
    add_column :lectures, :date_created, :string
  end
end
