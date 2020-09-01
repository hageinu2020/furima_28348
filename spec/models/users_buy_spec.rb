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

      it '郵便番号にハイフンがあれば購入できる' do
        @buy.code = '123-4567'
        expect(@buy).to be_valid
      end

      it '電話番号にハイフンがなく、11桁内であれば登録ができる' do
        @buy.tel = '08012321132'
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

      it 'codeにハイフンが入っていないと購入できない' do
        @buy.code = '1234567'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Code is invalid. Include hyphen(-)' )
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

      it 'telにハイフンが入っていると購入できない' do
        @buy.tel = '080-1234-5678'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Tel にはハイフンを使用しないでください。')
      end

      it 'telの桁数が11桁以上だと購入できない' do
        @buy.tel = '123456789123'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Tel にはハイフンを使用しないでください。')
      end
    end
  end
end