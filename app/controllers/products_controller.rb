class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

  def my_products
    @products = Product.where(user: current_user)
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:category, :name, :description, :expiration, :location, :photo, stocks_attributes: [:quantity, :user_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
