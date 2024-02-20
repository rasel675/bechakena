class ProductsController < ApplicationController

  def index
    if params[:search].present?
      @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    else
    @products = Product.all
    end
  end

  def import
  #   return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
  #   return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'
    ImportProductsCsv.new(params[:file]).call
    redirect_to root_path, notice: 'Import started...'
  end

  def show
    find_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      # category = @product.category
      # product_count = category.product_count
      # category.update(product_count: product_count + 1)

      ProductCountJob.set(wait: 1.minute).perform_later(@product)

      redirect_to product_url(@product)
    else
      render :new
    end
  end

  def edit
    find_product
  end

  def update
    find_product

    if @product.update(product_params)
      redirect_to product_url(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_product
    @product.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    #using strong parameters
    params.require(:product).permit(:name, :description, :price, :category_id)
  end

end
