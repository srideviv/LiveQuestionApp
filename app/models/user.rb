class User < ActiveRecord::Base
  has_many :posts

  def authenticate (username, pwd)
     if self.uname == username && self.password == pwd
        return true
     else
        return false
     end

  end
end
