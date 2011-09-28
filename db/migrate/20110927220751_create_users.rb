class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uname
      t.string :name
      t.string :email
      t.string  :password
      t.boolean :admin_perm

      t.timestamps
    end
  end
end
