require "csv"

class ImportProductsCsv 

  attr_reader :product_csv_file

  def initialize(product_csv_file)
    @product_csv_file = product_csv_file 
  end 

  def call 
    file_path = product_csv_file.path
    CSV.foreach(file_path, headers: true) do |row|
    Product.create(name: row["name"], description: row["description"], price: row["price"], category_id: row["category_id"])
    end
  end 
end 
  # opened_file = File.open(file)
  #   options = { headers: true, col_sep: ';' }
  #   CSV.foreach(opened_file, **options) do |row|
  #     # map the CSV columns to your database columns
  #     user_hash = {}
  #     user_hash[:email] = row['Email Address']
  #     user_hash[:username] = user_hash[:email].split('@').first
  #     user_hash[:name] = row['First Name']
  #     user_hash[:surname] = row['Last Name']
  #     user_hash[:preferences] = row['Favorite Food']
  #     user_hash[:phone] = row['Mobile phone number']

  #     User.find_or_create_by!(user_hash)