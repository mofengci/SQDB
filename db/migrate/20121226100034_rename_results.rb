class RenameResults < ActiveRecord::Migration
  def change
    rename_column :results, :staff, :female
  end
end
