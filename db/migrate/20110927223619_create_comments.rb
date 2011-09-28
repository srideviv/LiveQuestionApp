class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :reply

      t.timestamps
    end
  end
end
