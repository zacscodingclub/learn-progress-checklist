class ChangeWatchedDekaultValue < ActiveRecord::Migration
  def change
    change_column_default :lectures, :watched, 0
  end
end
