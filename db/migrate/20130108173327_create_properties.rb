class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :position, :default=>"staff"
    	t.boolean :ispoor , :default=>false
    	t.integer :priority, :default=>0
    	t.integer :user_id

      t.timestamps
    end
  end
end
