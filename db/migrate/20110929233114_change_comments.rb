class ChangeComments < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.references :post
    end
  end

  def down
  end
end
