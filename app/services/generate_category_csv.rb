require "csv"

class GenerateCategoryCsv
  attr_reader :categories

  def initialize(categories)
    @categories = categories
  end

  def call
    CSV.generate(headers: true) do |csv|
      csv << ["ID", "Name", "Details", "Created_at"]
      @categories.each do |category|
      csv << [category.id, category.name, category.details, category.created_at ]
      end
    end
  end
end