class AddValuesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ispoor, :boolen, default: false
    add_column :users, :priority, :integer, default: 0
    add_column :users, :userid, :string
    add_column :users, :code, :string
    add_column :users, :accesslevel, :integer
    add_column :users, :tel, :string, unique: true
    add_column :users, :qq, :string, unique: true
    add_column :users, :school, :string
  end
end
