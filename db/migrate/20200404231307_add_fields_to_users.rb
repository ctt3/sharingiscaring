class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change

	  change_table :users do |t|
		  t.string 		:first_name, 		null: false, default: ""
		  t.string 		:last_name, 		null: false, default: ""
		  t.datetime	:date_of_birth
		  t.string		:cellphone
	  end

  end
end