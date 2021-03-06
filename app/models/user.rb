class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
	create! do |user|
	  user.email = auth["extra"]["raw_info"]["email"]
	  user.provider = auth["provider"]
	  user.uid = auth["uid"]
	  user.name = auth["extra"]['raw_info']['login']
	end
    end
end
