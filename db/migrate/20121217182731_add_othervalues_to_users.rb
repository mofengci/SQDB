class AddOthervaluesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string, default: "male"
    add_column :users, :position, :string
  end
end
