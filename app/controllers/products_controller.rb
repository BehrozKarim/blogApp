class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    # byebug
    # current_user.products.create(product_params)
    @product = current_user.products.new(product_params)
    # @product = Product.new(product_params)
    if @product.save
      # flash[:success] = 'Product Created Successfully'
      redirect_to products_path
      # redirect_to @product
    else
      # flash[:error] = 'Product not created'
      render :new
    end
    # @product = Product.create(product_params)
    # if @product.save
    #     flash[:success] = "Product Created Successfully"
    #     redirect_to = @product
    # else
    #     flash[:error] = "Product not created"
    #     render :new
    # end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @product = current_user.products
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :quantity, :price)
  end
end
