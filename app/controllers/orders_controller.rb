class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index


  def index
    @item = Item.find(params[:item_id])
    unless current_user.id == @item.user_id || Order.where(item_id: @item.id).exists? 
     @order_address = OrderAddress.new
    else
     redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    # Payjp.api_key = "sk_test_a25027a6ca4a30b4511d47d5"
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end
