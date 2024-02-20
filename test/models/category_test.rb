require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  details       :text
#  name          :string           not null
#  product_count :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :bigint
#
