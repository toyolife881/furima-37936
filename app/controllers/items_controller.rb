class ItemsController < ApplicationController
  before_action :basic_auth

  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
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

  private


def item_params
  params.require(:item).permit(:image, :item_name, :item_explanation, :item_category_id, :item_status_id, :burden_of_charge_id,
                               :delivery_prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
end

end