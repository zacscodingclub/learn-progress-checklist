class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :learn_name
      t.string :password_digest
    end
  end
end
