class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms + Chatroom.where("user_two_id = #{current_user.id}")
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @message = Message.new
    @chatrooms = current_user.chatrooms + Chatroom.where("user_two_id = #{current_user.id}")
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @user2 = @product.user
    @chatroom = Chatroom.create(user: @user, user_two: @user2)
    @chatroom.user.name = @user.name
    @chatroom.user_two.name = @user2.name
    @chatroom.user_two_id = @user2.id
    @chatroom.name2 = @user.name
    @chatroom.name = @user2.name
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'new'
    end
  end
end
