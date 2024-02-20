class ProductCountJob < ApplicationJob
  queue_as :default

  def perform(product)
    product.category.increment!(:product_count)
  end
end