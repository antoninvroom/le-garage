class AddHeadlineAndImageAndLocatinAndUrlToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :headline, :string
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :url, :string
  end
end
