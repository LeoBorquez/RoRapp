class ProductsController < ApplicationController

  layout false #don't use layout "application.html.erb"

  def index
    @product = Product.all #Product = model

  end

  def show
    @product = Product.find(params[:id]) #show the object by id
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params) #call method post_params

    if @product.save
      redirect_to @product #if @post.save fails in this situation, we need to show the form back to the users. add IF because validation on model post
    else
      render 'new' #same request as the form submission
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to post_path

  end

  private def product_params #validation parameters form
    params.require(:product).permit(:name, :price, :stock, :category, :description) #require a title & body in the new form
  end

  def name_with_initial

  end


end

