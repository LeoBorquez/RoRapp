class CategorysController < ApplicationController

  layout false


  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

    def create
    @category = Category.new(category_params)

      if @category.save
        render template: 'products/new'
      else
        render 'new'
      end
    end

  private def category_params
    params.require(:category).permit(:name_category)
  end

end
