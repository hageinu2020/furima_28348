require 'rails_helper'

RSpec.describe Sale do
  before do
    user = FactoryBot.create(:user)
    @sale = FactoryBot.build(:sale, user_id: user.id)
    @sale.image = fixture_file_upload('public/images/sample.png')
  end

  describe 'ユーザー新規投稿' do
    context '新規投稿がうまくいくとき' do
      it '画像・商品名・説明・カテゴリー・状態・配送料・発送地・日数・価格が入力されていれば投稿できる' do
        expect(@sale).to be_valid
      end
      it '価格が300円以上で登録できる' do
        @sale.price = '300'
        expect(@sale).to be_valid
      end
    end

    context '新規投稿ができない場合' do
      it '画像がないと投稿できない' do
        @sale.image = nil
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと投稿できない' do
        @sale.name = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Name can't be blank")
      end

      it '商品名が40文字以上だと投稿できない' do
        @sale.name = 'a' * 41
        @sale.valid?
        expect(@sale.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it '説明がないと投稿できない' do
        @sale.text = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Text can't be blank")
      end

      it '説明が1001文字以上だと投稿できない' do
        @sale.text = 'a' * 1001
        @sale.valid?
        expect(@sale.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end

      it 'カテゴリーが選択されていないと投稿できない' do
        @sale.genre_id = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Genre can't be blank")
      end

      it 'カテゴリーが---だと投稿できない' do
        @sale.genre_id = '0'
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Genre must be other than 0")
      end

      it '状態が選択されていないと投稿できない' do
        @sale.status_id = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Status can't be blank")
      end

      it '状態が---だと投稿できない' do
        @sale.status_id = '0'
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Status must be other than 0")
      end

      it '配送料が選択されていないと投稿できない' do
        @sale.fee_id = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Fee can't be blank")
      end

      it '配送料が---だと投稿できない' do
        @sale.fee_id = '0'
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Fee must be other than 0")
      end

      it '発送地域が選択されていないと投稿できない' do
        @sale.area_id = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Area can't be blank")
      end

      it '発送地域が---だと投稿できない' do
        @sale.area_id = '0'
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Area must be other than 0")
      end

      it '日数が選択されていないと投稿できない' do
        @sale.day_id = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Day can't be blank")
      end

      it '日数が---だと投稿できない' do
        @sale.day_id = '0'
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Day must be other than 0")
      end

      it '価格が入力されていないと投稿できない' do
        @sale.price = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円以下だと投稿できない' do
        @sale.price = 'a' * 299
        @sale.valid?
        expect(@sale.errors.full_messages).to include('Price is not a number')
      end

      it '価格が9999999以上だと投稿できない' do
        @sale.price = 'a' * 10_000_000
        @sale.valid?
        expect(@sale.errors.full_messages).to include('Price is not a number')
      end

      it 'ユーザーが紐づいていないと投稿できない' do
        @sale.user_id = nil
        @sale.valid?
        expect(@sale.errors.full_messages).to include('User must exist')
      end
    end
  end
end
