class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :value
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
