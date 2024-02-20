class Variant < ApplicationRecord
  belongs_to :product
end

# == Schema Information
#
# Table name: variants
#
#  id         :bigint           not null, primary key
#  color      :string
#  size       :string
#  sku        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_variants_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
