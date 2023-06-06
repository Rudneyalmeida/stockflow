class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product = Product.new
    @product.stocks.build
  end

  def create
    @product = Product.new(product_params)
  
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def product_params
    params.require(:product).permit(:category, :name, :description, :expiration, :location, stocks_attributes: [:quantity, :user_id])
  end
end
