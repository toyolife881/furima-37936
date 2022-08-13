require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'token、post_code、prefecture_id、municipality、house_number、building_name、phone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      # //tokenのテスト//
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      # //post_codeのテスト//
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end    
      it 'post_codeが3桁ハイフン4桁でなければ登録できない' do
        @order_address.post_code = '0000-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end  
      it 'post_codeにハイフンが含まれていないと登録できない' do
        @order_address.post_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end    
      it 'post_codeが半角文字列でないと保存できない' do
        @order_address.post_code = '０００ー００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      # //prefecture_idのテスト//
      it 'prefecture_idが未選択では登録できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idで「---」を選択したら登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      # //municipalityのテスト//
      it 'municipalityが空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      # //house_numberのテスト//
      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      # //phone_numberのテスト//
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9文字以下では登録できない' do
        @order_address.phone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short or invalid")
      end
      it 'phone_numberが12文字以上では登録できない' do
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short or invalid")
      end
      it 'phone_numberにハイフンが含まれていると保存できない' do
        @order_address.phone_number = '00-000-000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short or invalid")
      end
      it 'phone_numberが半角数値でないと保存できない' do
        @order_address.phone_number = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short or invalid")
      end
      # //その他テスト//
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  
  end

end
