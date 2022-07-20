require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it 'image、item_name、item_explanation、item_category_id、item_status_id、burden_of_charge_id、delivery_prefecture_id、delivery_days_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      # //imageのテスト//
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      # //item_nameのテスト//
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      # //item_explanationのテスト//
      it 'item_explanationが空では登録できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      # //item_category_idのテスト//
      it 'item_category_idが未選択では登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_category_idで「---」を選択したら登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      # //item_status_idのテスト//
      it 'item_status_idが未選択では登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'item_status_idで「---」を選択したら登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      # //burden_of_charge_idのテスト//
      it 'burden_of_charge_idが未選択では登録できない' do
        @item.burden_of_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of charge can't be blank")
      end
      it 'burden_of_charge_idで「---」を選択したら登録できない' do
        @item.burden_of_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of charge can't be blank")
      end
      # //delivery_prefecture_idのテスト//
      it 'delivery_prefecture_idが未選択では登録できない' do
        @item.delivery_prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefecture can't be blank")
      end
      it 'delivery_prefecture_idで「---」を選択したら登録できない' do
        @item.delivery_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefecture can't be blank")
      end
      # //delivery_days_idのテスト//
      it 'delivery_days_idが未選択では登録できない' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end
      it 'delivery_days_idで「---」を選択したら登録できない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end
      # //priceのテスト//
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300〜9999999円の間でないと登録できない(300円より小さい場合)' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが300〜9999999円の間でないと登録できない(9999999円より大きい場合)' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数値でないと保存できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      # //その他テスト//
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
