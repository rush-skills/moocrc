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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
