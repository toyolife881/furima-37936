class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!, only:[:new, :edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
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

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id 
     redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
     redirect_to item_path(@item)
    else
     render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :item_category_id, :item_status_id, :burden_of_charge_id,
                                 :delivery_prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end

