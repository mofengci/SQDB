class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :staff
      t.integer :manager

      t.timestamps
    end
  end
end
