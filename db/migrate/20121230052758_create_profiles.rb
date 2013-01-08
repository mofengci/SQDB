class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string	:tel
    	t.string	:qq
    	t.string	:school
    	t.string	:sex
    	t.integer	:user_id

      t.timestamps
    end
  end
end
