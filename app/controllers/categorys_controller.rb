class CategorysController < ApplicationController

  layout false

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
    @option = Category.all
  end

  private def category_params
    params.require(:category).permit(:name_category)
  end

  def categorysSelection

  end

end
