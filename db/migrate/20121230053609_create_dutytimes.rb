class CreateDutytimes < ActiveRecord::Migration
  def change
    create_table :dutytimes do |t|
    	t.integer	:dutytime_0 ,:default=> 0
    	t.integer	:dutytime_1 ,:default=> 0
    	t.integer	:dutytime_2 ,:default=> 0
    	t.integer	:dutytime_3 ,:default=> 0
    	t.integer :user_id

      t.timestamps
    end
  end
end
