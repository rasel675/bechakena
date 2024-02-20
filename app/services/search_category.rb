class SearchCategory

  def self.call(search_term_class_method)
    new(search_term_class_method).call
  end

  attr_reader :search_term_instance_method
  
  def initialize(search_term_instance_method)
    @search_term_instance_method = search_term_instance_method
  end

  def call
    if search_term_instance_method.present?
      Category.where("name ILIKE ?", search_term_instance_method).or(Category.where("details ILIKE ?", "%#{search_term_instance_method}%"))
    else
      Category.all
    end
  end 
end 