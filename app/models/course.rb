# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  image       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#  instructor  :string
#

class Course < ActiveRecord::Base
  belongs_to :user
  has_many :deadlines
end
