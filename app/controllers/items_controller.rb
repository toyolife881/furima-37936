class ItemsController < ApplicationController
  before_action :basic_auth

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    render :new unless @item.save
  end
end

  private

def basic_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
  end
end

def item_params
  params.require(:item).permit(:image, :item_name, :item_explanation, :item_category_id, :item_status_id, :burden_of_charge_id,
                               :delivery_prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
end
