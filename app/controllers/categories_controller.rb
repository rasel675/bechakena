class CategoriesController < ApplicationController
  def index
    # @categories = SearchCategory.new(params[:search]).call
    @categories = SearchCategory.call(params[:search])

    authorize @categories

    respond_to do |format|
      format.html{}
      format.csv{send_data GenerateCategoryCsv.new(@categories).call, filename: "Category-#{Date.today}.csv"}
    end

  end

  def show
    find_category
    authorize @category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)

    authorize @category

    if @category.save
      CategoryMailer.info_email(@current_user).deliver_later
      redirect_to category_url(@category)
    else
      render :new
    end
  end

  def edit
    find_category
  end

  def update
    find_category

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_category
    @category.destroy
    redirect_to root_path, status: :see_other
  end

  private

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      #using strong parameters
      params.require(:category).permit(:name, :category_id, :details)

    end
end
