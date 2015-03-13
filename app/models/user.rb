class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
  	logger.debug auth.to_s + "-----------------"
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.token = auth['credentials']['token']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
