class AddTextTable < ActiveRecord::Migration
  def change
  	create_table :texts do |t|
  		t.references :user
  		t.text :text
  		t.string :name

  		t.timestamps
  	end
  end
end
