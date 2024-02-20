class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false 
      t.bigint :category_id
      t.text :details

      t.timestamps
    end
  end
end
