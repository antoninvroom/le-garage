class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :type, :type_user
  end
end
