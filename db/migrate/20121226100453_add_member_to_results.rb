class AddMemberToResults < ActiveRecord::Migration
  def change
    add_column :results,:coach,:integer
    add_column :results,:male1,:integer
    add_column :results,:male2,:integer
  end
end
