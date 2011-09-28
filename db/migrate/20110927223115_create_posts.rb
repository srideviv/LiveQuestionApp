class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :question
      t.references :user

      t.timestamps
    end
  end
end
