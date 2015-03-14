# == Schema Information
#
# Table name: deadlines
#
#  id         :integer          not null, primary key
#  title      :string
#  completed  :boolean
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DeadlineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
