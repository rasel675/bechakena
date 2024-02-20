class VariantsController < ApplicationController
  
  def new 
    find_product
    @variant = @product.variants.new
  end 
  
  def create
    find_product
    @variant = @product.variants.create(variant_params)
      redirect_to product_path(@product)
  end

  def edit 
    find_product
    find_variant
  end 

  def update 
    find_product
    find_variant
    if @variant.update(variant_params) 
      redirect_to @product
    else 
      render :edit, status: :unprocessable_entity
    end 
  end 

  def destroy 
    find_product
    find_variant

    @variant.destroy 
    redirect_to @product 

  end 
  
    private
      def variant_params
        params.require(:variant).permit(:color, :size, :sku, :product_id)
      end

      def find_product
        @product = Product.find(params[:product_id])
      end 

      def find_variant 
        @variant = Variant.find(params[:id])
      end 

end
