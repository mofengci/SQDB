class AddDutyvaluesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :history_1, :integer, default:0
    add_column :users, :history_2, :integer, default:0
    add_column :users, :history_3, :integer, default:0
    add_column :users, :history_4, :integer, default:0
    add_column :users, :history_5, :integer, default:0
    add_column :users, :history_6, :integer, default:0
    add_column :users, :history_7, :integer, default:0
    add_column :users, :history_8, :integer, default:0
    add_column :users, :avadutytime_0, :integer, default:0
    add_column :users, :avadutytime_1, :integer, default:0
    add_column :users, :avadutytime_2, :integer, default:0
    add_column :users, :avadutytime_3, :integer, default:0
  end
end
