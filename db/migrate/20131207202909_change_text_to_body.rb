class ChangeTextToBody < ActiveRecord::Migration
  def change
  	rename_column :texts, :text, :body
  end
end
