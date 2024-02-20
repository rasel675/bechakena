class AddProductCountToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :product_count, :integer, default: 0

    Category.find_each do |category|
      product_count = category.products.count
      category.update!(product_count: product_count)
    end
  end
end
