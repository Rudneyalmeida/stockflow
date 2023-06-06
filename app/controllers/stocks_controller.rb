class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = Stock.all
    # @stocks = Stock.where.not(user_id: current_user.id)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end


def set_stock
  @stock = Stock.find(params[:id])
end