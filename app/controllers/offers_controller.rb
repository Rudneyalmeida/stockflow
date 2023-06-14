class OffersController < ApplicationController
  def index
    @offers = current_user.offers
    @received_offers = Offer.where(product: current_user.products)
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @product = Product.find(params[:product_id])
    @products = current_user.products.where.not(offered: true)
  end

  def accept
    @offer = Offer.find(params[:id])
    @offer.accepted!
    @offer.trades.each { |trade| trade.product.update(offered: true) } # Update the offered attribute of all associated products
    # Reject all other offers for the same product
    Offer.where(product: @offer.product).where.not(id: @offer.id).update_all(status: "rejected")
    redirect_to offers_path
  end

  def reject
    @offer = Offer.find(params[:id])
    @offer.rejected!
    redirect_to offers_path
  end

  def create
    @offer = Offer.new
    @product = Product.find(params[:product_id])
    @offer.product = @product
    @offer.user = current_user
    @offer.status = "pending"
    if @offer.save
      params[:offer][:product_ids].uniq.reject(&:blank?).each do |product_id|
        Trade.create!(offer: @offer, product_id: product_id)
      end
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def num_received
    num_received = current_user.offers.received.count
    render json: { num_received: num_received }
  end

  def edit
  end


  def update
  end

  def destroy
  end

end
