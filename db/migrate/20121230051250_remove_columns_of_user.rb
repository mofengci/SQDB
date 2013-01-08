class RemoveColumnsOfUser < ActiveRecord::Migration
  def change
  	remove_column :users, :ispoor
  	remove_column :users, :priority
  	remove_column :users, :code
  	remove_column :users, :accesslevel
  	remove_column :users, :tel
  	remove_column :users, :school
  	remove_column :users, :qq
  	remove_column :users, :sex
  	remove_column :users, :position
  	remove_column :users, :history_1
  	remove_column :users, :history_2
  	remove_column :users, :history_3
  	remove_column :users, :history_4
  	remove_column :users, :history_5
  	remove_column :users, :history_6
  	remove_column :users, :history_7
  	remove_column :users, :history_8
  	remove_column :users, :avadutytime_0
  	remove_column :users, :avadutytime_1
  	remove_column :users, :avadutytime_2
  	remove_column :users, :avadutytime_3
  end
end
