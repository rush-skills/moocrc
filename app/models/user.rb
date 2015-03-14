# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#

class User < ActiveRecord::Base
  has_many :courses
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
