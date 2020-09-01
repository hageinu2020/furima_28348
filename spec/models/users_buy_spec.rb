require 'rails_helper'

describe Buy do
  before do
    @buy = FactoryBot.build(:users_buy)
  end

  describe 'ユーザーの商品購入' do
    context '商品の購入が上手く行く時' do
      it 'code、area_id,city,address、tel、tokenがあれば購入できる' do
        expect(@buy).to be_valid
      end
    end

    context '商品の購入が上手くいかない時' do
      it 'カード情報がないと購入できない' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end

      it 'codeがないと購入できない' do
        @buy.code = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Code is invalid. Include hyphen(-)')
      end

      it 'area_idが選択されていないと購入できない' do
        @buy.area_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityがないと購入できない' do
        @buy.city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end

      it 'addressがないと購入できない' do
        @buy.address = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end

      it 'telがないと購入できない' do
        @buy.tel = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Tel にはハイフンを使用しないでください。')
      end
    end
  end
end
