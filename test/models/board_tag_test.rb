# == Schema Information
#
# Table name: board_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  tag_id     :integer
#
# Indexes
#
#  index_board_tags_on_board_id  (board_id)
#  index_board_tags_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (tag_id => tags.id)
#
require 'test_helper'

class BoardTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
