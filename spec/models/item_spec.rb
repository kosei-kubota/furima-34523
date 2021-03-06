require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it 'name、price、description、category、condition、burden、country、day、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが紐付いていないと保存できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'category_idが1の場合は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
  
      it 'conditionが紐付いていないと保存できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end

      it 'condition_idが1の場合は保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'burdenが紐付いていないと保存できない' do
        @item.burden = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end

      it 'burden_idが1の場合は保存できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
  
      it 'countryが紐付いていないと保存できない' do
        @item.country = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Country is not a number")
      end

      it 'country_idが1の場合は保存できない' do
        @item.country_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Country must be other than 1")
      end

      it 'dayが紐付いていないと保存できない' do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end

      it 'day_idが1の場合は保存できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが¥300以内では保存できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが¥9,999,999以上では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角数字以外では保存できない' do
        @item.price = 'aaaあああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが全角文字では保存できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角英数混合では保存できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角英語だけでは保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end 
  end
end
