class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Image, :string
  end
end
