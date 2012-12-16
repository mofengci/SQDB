class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolen, default: false
  end
end
