class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @message = Message.new
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @user2 = @product.user
    @chatroom = Chatroom.create(user: current_user, user_two: @product.user)
    @chatroom.user = @user
    @chatroom.user_two = @user2
    @chatroom.name = "Messaging #{@user2.name}"
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'new'
    end
  end
end
