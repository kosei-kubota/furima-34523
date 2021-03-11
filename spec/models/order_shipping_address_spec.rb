require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping_address).to be_valid
      end

      it 'buildは空でも保存できる' do
        @order_shipping_address.build = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postalが空では保存できない' do
        @order_shipping_address.postal = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal can't be blank")
      end

      it 'postalは半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_shipping_address.postal = 1234567
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end

      it 'tokenが空では保存できない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'cityが空では保存できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは11桁以上では保存できない' do
        @order_shipping_address.phone_number = '090123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is out of setting range")
      end

      it 'country_idが1の場合は保存できない' do
        @order_shipping_address.country_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Country must be other than 1")
      end

      it 'userが紐付いていないと保存できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'phone_numberが英数混合では保存できない' do
        @order_shipping_address.phone_number = 'aaaaa111111'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is out of setting range")
      end

      it 'phone_numberにハイフンが記述された場合は保存できない' do
        @order_shipping_address.phone_number = '090-1234-5678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is out of setting range")
      end
    end
  end
end
