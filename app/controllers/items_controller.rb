class ItemsController < ApplicationController
  before_action :basic_auth

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :item_category_id, :item_status_id, :burden_of_charge_id,
                                 :delivery_prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
