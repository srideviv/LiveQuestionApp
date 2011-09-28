class AddUsers < ActiveRecord::Migration
  def up
    User.create :uname => "admin",
                 :name => "admin",
                 :password => "adminpassword",
                 :admin_perm => true
  end
  def down
  end
end
