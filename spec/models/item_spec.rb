require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it 'image、item_name、item_explanation、item_category、item_status、burden_of_charge、delivery_prefecture、delivery_days、priceが存在すれば登録できる' do
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
      # //item_categoryのテスト//
      it 'item_categoryが未選択では登録できない' do
        @item.item_category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      # //item_statusのテスト//
      it 'item_statusが未選択では登録できない' do
        @item.item_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      # //burden_of_chargeのテスト//
      it 'burden_of_chargeが未選択では登録できない' do
        @item.burden_of_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of charge can't be blank")
      end
      # //delivery_prefectureのテスト//
      it 'delivery_prefectureが未選択では登録できない' do
        @item.delivery_prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefecture can't be blank")
      end
      # //delivery_daysのテスト//
      it 'delivery_daysが未選択では登録できない' do
        @item.delivery_days = nil
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
    end
  end
end
